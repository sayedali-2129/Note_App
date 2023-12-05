import 'package:hive/hive.dart';
import 'package:todo_app/model/note_model/note_model.dart';

class NoteListController {
  var box = Hive.box<NoteModel>("notebox");

  addtoList(noteItems) async {
    await box.add(noteItems);
  }

  deletefromList(noteItems) async {
    await box.delete(noteItems);
  }

  listUpdate(var itemKey, NoteModel items) {
    box.putAt(
        itemKey,
        NoteModel(
            title: items.title,
            description: items.description,
            date: items.date));
  }
}
