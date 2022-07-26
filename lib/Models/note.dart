class Notes {
  final String title;
  final String notesContents;
  final DateTime currentTime;

  Notes({
    required this.title,
    required this.notesContents,
    DateTime? currentTime,
  }) : currentTime = currentTime ?? DateTime.now();
}
