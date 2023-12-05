import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/controller/note_controller.dart';
import 'package:todo_app/model/note_model/note_model.dart';
import 'package:todo_app/utils/color_constant/color_constant.dart';
import 'package:todo_app/utils/image_constants/image_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<NoteModel>("notebox");

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final textKey = GlobalKey<FormState>();

  int selectedIndex = 0;
  List myModelList = [];
  @override
  void initState() {
    myModelList = box.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.bgColor,
      appBar: AppBar(
        backgroundColor: ConstantColor.themeColor,
        title: Row(
          children: [
            Text("My Notes"),
            SizedBox(
              width: 5,
            ),
            Image.asset(
              "assets/pngs/notes-icon.png",
              height: 30,
              width: 30,
              color: ConstantColor.whiteColor,
            )
          ],
        ),
        titleTextStyle: TextStyle(fontFamily: "Kanit", fontSize: 25),
      ),
      body: myModelList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.mainBgPng,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create Your First Note!!",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 2,
                  ),
              itemCount: myModelList.length,
              itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ConstantColor.tileColor[
                              box.get(myModelList[index])!.colorList ?? 0],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    box.get(myModelList[index])!.title,
                                    style: TextStyle(
                                        color: ConstantColor.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          titleController.text = box
                                              .get(myModelList[index])!
                                              .title;
                                          descriptionController.text = box
                                              .get(myModelList[index])!
                                              .description;

                                          dateController.text = box
                                                  .get(myModelList[index])!
                                                  .date ??
                                              "";

                                          updateBottomSheet(context, index);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: ConstantColor.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          NoteListController().deletefromList(
                                              myModelList[index]);
                                          myModelList = box.keys.toList();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: ConstantColor.whiteColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                box.get(myModelList[index])!.description,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    color: ConstantColor.whiteColor,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share,
                                        color: ConstantColor.whiteColor,
                                        size: 25,
                                      ),
                                    ),
                                    Text(
                                      box.get(myModelList[index])!.date ?? "",
                                      style: TextStyle(
                                          color: ConstantColor.whiteColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheetRefactor(context);
        },
        child: Icon(Icons.add),
        backgroundColor: ConstantColor.themeColor,
      ),
    );
  }

  Future<dynamic> updateBottomSheet(BuildContext context, index) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) =>
            StatefulBuilder(builder: (context, updateSetState) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: ConstantColor.themeColor),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: dateController,
                          decoration: InputDecoration(
                              hintText: "Date",
                              filled: true,
                              fillColor: ConstantColor.whiteColor,
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    final DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2024));

                                    final formattedDate =
                                        DateFormat("dd-MM-yyyy").format(date!);

                                    setState(() {});
                                    dateController.text =
                                        formattedDate.toString();
                                  },
                                  icon: Icon(Icons.calendar_month))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: textKey,
                        child: Container(
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
                                    updateSetState(() {
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ConstantColor.whiteColor)),
                        onPressed: () {
                          box.put(
                              myModelList[index],
                              NoteModel(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  date: dateController.text,
                                  colorList: selectedIndex));
                          myModelList = box.keys.toList();
                          titleController.clear();
                          descriptionController.clear();
                          dateController.clear();
                          Navigator.pop(context);
                          updateSetState(() {});
                          setState(() {});
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(
                              color: ConstantColor.themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future<dynamic> bottomSheetRefactor(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, inSetState) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: textKey,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: ConstantColor.themeColor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 8,
                            right: 8,
                          ),
                          child: TextFormField(
                            controller: titleController,
                            validator: (value) {
                              if (titleController.text.isEmpty) {
                                return "Enter Title";
                              } else {
                                return null;
                              }
                            },
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
                            child: TextFormField(
                              controller: descriptionController,
                              validator: (value) {
                                if (titleController.text.isEmpty) {
                                  return "Enter Description";
                                } else {
                                  return null;
                                }
                              },
                              maxLines: null,
                              expands: true,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  filled: true,
                                  fillColor: ConstantColor.whiteColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            readOnly: true,
                            controller: dateController,
                            validator: (value) {
                              if (titleController.text.isEmpty) {
                                return "Pick Date";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Date",
                                filled: true,
                                fillColor: ConstantColor.whiteColor,
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final DateTime? date =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2024));

                                      final formattedDate =
                                          DateFormat("dd-MM-yyyy")
                                              .format(date!);

                                      setState(() {});
                                      dateController.text =
                                          formattedDate.toString();
                                    },
                                    icon: Icon(Icons.calendar_month))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Color pick
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
                            if (titleController.text.isNotEmpty) {
                              final data = NoteModel(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  date: dateController.text,
                                  colorList: selectedIndex);
                              box.add(data);
                              myModelList = box.keys.toList();

                              titleController.clear();
                              descriptionController.clear();
                              dateController.clear();
                              Navigator.pop(context);
                              inSetState(() {});
                              setState(() {});
                            } else if (textKey.currentState!.validate()) ;
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: ConstantColor.themeColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
