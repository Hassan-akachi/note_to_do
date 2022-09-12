class Notes {
  int id;
  final String title;
  final String notesContents;
  final DateTime currentTime;

  Notes({
    required this.id,
    required this.title,
    required this.notesContents,
    DateTime? currentTime,
  }) : currentTime = currentTime ?? DateTime.now();
}
