import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Providers/notes_provider.dart';
import '../Providers/to_do_list_provider.dart';
import '../Util/constant.dart';


class SetTime extends StatelessWidget {
    DateTime now;
    WidgetUse widgetUse;

   SetTime({Key? key,  required this.now,required this.widgetUse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat("yyy-MM-dd");
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: true, minTime: DateTime.now(),
                  // maxTime: DateTime(2023, 6, 7),
                  onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    if(widgetUse == WidgetUse.todo){
                      now = date;
                   // Provider.of<ToDoListProvider>(context,listen: false).setTime(now);
                    print(now);}
                    else{
                      Provider.of<NoteProvider>(context,listen: false).setTime(date);

                    }
                  },
                  currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Text(
              "${formatter.format(now)}   ${DateFormat('EEE,hh:mm a').format(now)}",
              style: const TextStyle(fontSize: 20),
            )),
        Switch(value: true, onChanged: (bool isSet) {})
      ],
    );
  }
}
