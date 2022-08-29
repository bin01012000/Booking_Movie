import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChossesBirthday extends StatefulWidget {
  ChossesBirthday({Key? key, required this.birthdayController})
      : super(key: key);

  TextEditingController birthdayController = TextEditingController();

  @override
  State<ChossesBirthday> createState() => _ChossesBirthdayState();
}

class _ChossesBirthdayState extends State<ChossesBirthday> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.birthdayController,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      //editing controller of this TextField
      decoration: const InputDecoration(
        icon: Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
        labelStyle: TextStyle(color: Colors.white, fontSize: 15),
        labelText: "Birthday",
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      readOnly: true,

      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          String formattedDate = DateFormat.yMMMMEEEEd().format(pickedDate);
          setState(() {
            widget.birthdayController.text = formattedDate;
          });
        } else {}
      },
    );
  }
}
