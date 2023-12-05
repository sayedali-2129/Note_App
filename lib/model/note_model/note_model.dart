import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String? date;
  @HiveField(4)
  int? colorList;
  NoteModel({
    required this.title,
    required this.description,
    this.date,
    this.colorList,
  });
}
