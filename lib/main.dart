import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/model/note_model/note_model.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:todo_app/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  var box = await Hive.openBox<NoteModel>("notebox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "Ubuntu",
            colorScheme: ColorScheme.light(
              error: Colors.black,
            )),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
