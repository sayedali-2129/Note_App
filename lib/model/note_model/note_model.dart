class NoteModel {
  String title;
  String description;
  String? date;
  int colorList;
  NoteModel({
    required this.title,
    required this.description,
    this.date,
    required this.colorList,
  });
}
