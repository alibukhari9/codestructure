import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  bool isObsure;
  var inputType;
  CustomTextField(
      {required this.label,
      required this.controller,
      this.isObsure = false,
      this.inputType});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 5,
        ),
        Container(
          // padding: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.6,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: TextField(
            keyboardType: inputType,
            obscureText: isObsure,
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                isDense: true),
          ),
        ),
      ],
    );
  }
}
