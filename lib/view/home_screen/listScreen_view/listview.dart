// import 'package:flutter/material.dart';
// import 'package:todo_app/model/note_model/note_model.dart';
// import 'package:todo_app/utils/color_constant/color_constant.dart';
// import 'package:todo_app/view/card_open_screen/card_open_screen.dart';

// import 'package:todo_app/view/home_screen/listScreen_view/listviewcard.dart';

// class ListScreen extends StatefulWidget {
//   const ListScreen({super.key});

//   @override
//   State<ListScreen> createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   List<NoteModel> myModelList = [];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => SizedBox(
//         height: 2,
//       ),
//       itemCount: myModelList.length,
//       itemBuilder: (context, index) => InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CardOpenScreen(),
//               ));
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListViewCard(
//             selectedTileColor: ConstantColor.tileColor[index],
//             title: myModelList[index].title,
//             description: myModelList[index].description,
//           ),
//         ),
//       ),
//     );
//   }
// }
