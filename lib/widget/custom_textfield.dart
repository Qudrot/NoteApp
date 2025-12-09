import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.textEditingController,
    this.maxLines = 1,
    this.showUnderline = true,
    this.fontSize = 24,
    this.fontWeight = FontWeight.bold,
  });

  final TextEditingController? textEditingController;
  final String label;
  final int? maxLines;
  final bool showUnderline;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      showCursor: true,
      cursorColor: Colors.grey.shade700,
      maxLines: maxLines,
      textInputAction: maxLines == null? TextInputAction.newline : TextInputAction.next,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        hintText: label,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: showUnderline? UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ) : InputBorder.none,
        focusedBorder: showUnderline? const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ) : InputBorder.none,
      ),
    );
  }
}
