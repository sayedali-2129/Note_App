import 'package:flutter/material.dart';
import 'package:todo_app/model/note_model/note_model.dart';
import 'package:todo_app/utils/color_constant/color_constant.dart';

import 'package:todo_app/view/home_screen/listScreen_view/listviewcard.dart';

import '../card_open_screen/card_open_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> myModelList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.bgColor,
      appBar: AppBar(
        backgroundColor: ConstantColor.themeColor,
        title: Text("My Notes"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 2,
        ),
        itemCount: myModelList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardOpenScreen(),
                ));
          },
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListViewCard(
                selectedTileColor:
                    ConstantColor.tileColor[myModelList[index].colorList],
                title: myModelList[index].title,
                description: myModelList[index].description,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) =>
                  StatefulBuilder(builder: (context, inSetState) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: ConstantColor.themeColor),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 70,
                              left: 8,
                              right: 8,
                            ),
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  hintText: "Title",
                                  filled: true,
                                  fillColor: ConstantColor.whiteColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 150,
                              child: TextField(
                                controller: descriptionController,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                    hintText: "Description",
                                    filled: true,
                                    fillColor: ConstantColor.whiteColor),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.all(8),
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //         hintText: "Date",
                          //         filled: true,
                          //         fillColor: ConstantColor.whiteColor),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            child: ListView.builder(
                              itemCount: ConstantColor.tileColor.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: ConstantColor.tileColor[index],
                                          border: Border.all(
                                              width: 2,
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onTap: () {
                                      inSetState(() {
                                        selectedIndex = index;
                                      });
                                      print(selectedIndex);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    ConstantColor.whiteColor)),
                            onPressed: () {
                              myModelList.add(NoteModel(
                                colorList: selectedIndex,
                                title: titleController.text,
                                description: descriptionController.text,
                              ));

                              titleController.clear();
                              descriptionController.clear();
                              Navigator.pop(context);
                              inSetState(() {});
                              setState(() {});
                              ;
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: ConstantColor.themeColor),
                            ),
                          )
                        ],
                      ),
                    );
                  }));
        },
        child: Icon(Icons.add),
        backgroundColor: ConstantColor.themeColor,
      ),
    );
  }
}
