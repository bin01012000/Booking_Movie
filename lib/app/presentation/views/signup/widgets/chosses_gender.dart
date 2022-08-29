import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChossesGender extends StatefulWidget {
  ChossesGender({Key? key, required this.gender}) : super(key: key);
  bool gender;
  @override
  State<ChossesGender> createState() => _ChossesGenderState();
}

String? _selectedValue;
List<String> listOfValue = ['Male', 'Female'];

class _ChossesGenderState extends State<ChossesGender> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Colors.black,
      decoration: const InputDecoration(
        icon: Icon(
          Icons.person_pin,
          color: Colors.white,
        ),
        border: UnderlineInputBorder(),
        labelText: 'Gender',
        labelStyle: TextStyle(color: Colors.white, fontSize: 15),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 15),
      value: _selectedValue,
      hint: const Text(
        'Choose gender',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      isExpanded: true,
      onChanged: (value) {
        if (value == "Male") {
          setState(() {
            _selectedValue = value.toString();
            widget.gender = true;
          });
        } else {
          setState(() {
            _selectedValue = value.toString();
            widget.gender = false;
          });
        }
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      items: listOfValue.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }
}
