import 'package:donatello_project/screens/new_card_screen.dart';
import 'package:flutter/material.dart';

class TextFieldCard extends StatefulWidget {
  final String labelText;
  final double height;
  final String hintText;
  final TextEditingController controller;

  TextFieldCard(this.labelText, this.height, this.hintText, this.controller);

  @override
  State<TextFieldCard> createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  final myController = TextEditingController();

  final Map<String, String> infoCard = {};

  //@override
  // void dispose() {
  //   // infoCard.putIfAbsent(widget.labelText, () => myController.text);
  //   // print(infoCard);
  //   NewCardScreen.infoAboutCard.putIfAbsent(widget.labelText, () => myController.text);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      style: TextStyle(
        fontSize: widget.height,
      ),
      decoration: InputDecoration(
        helperText: widget.hintText,
        helperStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFABB4BD),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: const Color(0xFFF4F4F4),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xFFF4F4F4),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        // hintText: 'Amount in USD',
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color(0xFFABB4BD),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
