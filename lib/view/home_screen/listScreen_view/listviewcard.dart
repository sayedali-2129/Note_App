// import 'package:flutter/material.dart';
// import 'package:todo_app/utils/color_constant/color_constant.dart';

// class ListViewCard extends StatelessWidget {
//   const ListViewCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.selectedTileColor,
//   });

//   final String title;
//   final String description;
//   final Color selectedTileColor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color:  ConstantColor.tileColor[myModelList[index].colorList], borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                myModelList[index].title,
//                 style: TextStyle(
//                     color: ConstantColor.whiteColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               ),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.edit,
//                       color: ConstantColor.whiteColor,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.delete,
//                       color: ConstantColor.whiteColor,
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             myModelList[index].description,
//             style: TextStyle(color: ConstantColor.whiteColor, fontSize: 15),
//           )
//         ]),
//       ),
//     );
//   }
// }
