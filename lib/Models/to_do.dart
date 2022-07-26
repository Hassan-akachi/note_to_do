

class ToDo{
  final String name;
   bool isChecked;

    ToDo({
    required this.name,
    this.isChecked=false,
  });

  void toggleCheck(){
    isChecked = !isChecked;
  }
}