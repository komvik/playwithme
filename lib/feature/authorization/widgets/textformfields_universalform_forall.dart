import 'package:flutter/material.dart';

//============================================
//
// universal TextFormField used for registration
//____________________________________________

class AdaptiveTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String labelText;
  final ValueChanged<String> onChanged;
  final double setWidth;

  const AdaptiveTextFormField({
    super.key,
    required this.controller,
    required this.errorText,
    required this.labelText,
    required this.onChanged,
    this.setWidth = 260,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setWidth,
      height: 80,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorWidth: 3.0,
        cursorHeight: 30.0,
        cursorColor: Colors.white,
        cursorErrorColor: Colors.red,
        style: const TextStyle(color: Colors.white),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: const TextStyle(
            color: Color.fromARGB(255, 204, 219, 2),
            fontSize: 12,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 253, 29, 29),
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
