import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/utils/color_constant/color_constant.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/animations/Animation - 1701610684182.json",
                height: 250, width: 250),
            Text(
              "MY NOTE APP",
              style: TextStyle(
                fontFamily: "Kanit",
                fontWeight: FontWeight.w500,
                color: ConstantColor.blackCokor,
                fontSize: 35,
                // shadows: [
                //   Shadow(
                //       color: Colors.black45,
                //       blurRadius: 10,
                //       offset: Offset(2, 2))
                // ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
