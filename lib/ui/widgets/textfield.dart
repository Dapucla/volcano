import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter
import 'package:volcano/data/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters; // Define inputFormatters

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters, // Accept inputFormatters as an optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjust vertical padding to reduce height
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      inputFormatters: inputFormatters,
    );
  }
}
