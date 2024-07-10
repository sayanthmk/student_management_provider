import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Icon prefixIcon;
  final TextInputType keyboard;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboard,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '* Required Field';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
