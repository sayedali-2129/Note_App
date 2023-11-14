// import 'package:flutter/material.dart';
// import 'package:todo_app/model/note_model/note_model.dart';
// import 'package:todo_app/utils/color_constant/color_constant.dart';

// class BottomDataSheet extends StatefulWidget {
//   BottomDataSheet({super.key, required this.myModelList});

//   final List<NoteModel> myModelList;

//   @override
//   State<BottomDataSheet> createState() => _BottomDataSheetState();
// }

// class _BottomDataSheetState extends State<BottomDataSheet> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController titleController = TextEditingController();
//     TextEditingController descriptionController = TextEditingController();

//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(50), topRight: Radius.circular(50)),
//           color: ConstantColor.themeColor),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 70,
//               left: 8,
//               right: 8,
//             ),
//             child: TextField(
//               controller: titleController,
//               decoration: InputDecoration(
//                   hintText: "Title",
//                   filled: true,
//                   fillColor: ConstantColor.whiteColor),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: SizedBox(
//               height: 150,
//               child: TextField(
//                 controller: descriptionController,
//                 maxLines: null,
//                 expands: true,
//                 decoration: InputDecoration(
//                     hintText: "Description",
//                     filled: true,
//                     fillColor: ConstantColor.whiteColor),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8),
//           //   child: TextField(
//           //     decoration: InputDecoration(
//           //         hintText: "Date",
//           //         filled: true,
//           //         fillColor: ConstantColor.whiteColor),
//           //   ),
//           // ),
//           ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStatePropertyAll(ConstantColor.whiteColor)),
//             onPressed: () {
//               widget.myModelList.add(NoteModel(
//                   title: titleController.text,
//                   description: descriptionController.text));
//               setState(() {});

//               Navigator.pop(context);
//             },
//             child: Text(
//               "Save",
//               style: TextStyle(color: ConstantColor.themeColor),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
