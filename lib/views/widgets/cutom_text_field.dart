import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onsaved,
      this.onChanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onsaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onsaved,
      cursorColor: KprimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: KprimaryColor),
        border: BorderBuilder(),
        enabledBorder: BorderBuilder(),
        focusedBorder: BorderBuilder(KprimaryColor),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder BorderBuilder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
