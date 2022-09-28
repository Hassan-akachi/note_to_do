import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_to_do/Screens/recycle_screen.dart';
import 'package:note_to_do/Screens/settings_screen.dart';

class PopMenu extends StatelessWidget {
  const PopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (item) => onSelected(context, item),
        itemBuilder: (context) => [
          menuItem(0, "Sort", Icons.swap_vert),
          menuItem(1, "RecycleBin", Icons.recycling),
          menuItem(2, "Settings", Icons.settings),
            ]);
  }

  PopupMenuItem menuItem(int item,String name,IconData icon) {
    return PopupMenuItem(
      value: item,
        child: Row(
      children:  [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(name),
      ],
    ));
  }

  onSelected(BuildContext context, item) {
    switch (item) {
      case 0:

        break;
      case 1:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RecycleBinScreen()));
        break;
      }
      case 2:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SettingsScreen()));
    }

  }
}
}
