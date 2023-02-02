import 'package:donatello_project/screens/new_card_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class TextFieldCard extends StatefulWidget {
  final String labelText;
  final double height;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  TextFieldCard(this.labelText, this.height, this.hintText, this.controller, this.validator);

  @override
  State<TextFieldCard> createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  final Map<String, String> infoCard = {};

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          style:
              TextStyle(fontSize: widget.height, fontWeight: FontWeight.w400),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Styles.colorForTextField,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Styles.colorForTextField,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Styles.colorForTextField,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      Container(
        color: Colors.white,
        child: FittedBox(
          child: Text(
            widget.labelText,
            style: Styles.fontForTextField,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 87),
        child: Text(
          widget.hintText,
          style: Styles.fontForHint,
        ),
      ),
    ]);
  }
}
