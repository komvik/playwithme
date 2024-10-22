import 'package:flutter/material.dart';

class CreateInputTextField extends StatelessWidget {
  final Function(String value) onChange;

  final double inputWidth;
  final double inputHeight;

  final double inputRadius;
  final String label;
  final bool inputObscureText;

  const CreateInputTextField({
    super.key,
    required this.label,
    required this.inputObscureText,
    required this.inputRadius,
    required this.inputWidth,
    required this.inputHeight,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inputWidth,
      height: inputHeight,
      child: TextField(
        onChanged: (value) => onChange,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),

          //______________________________________________________

          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 18),
          //______________________________________________________

          hintText: label,

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 6, 65, 99)),
            borderRadius: BorderRadius.all(
              Radius.circular(inputRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            borderRadius: BorderRadius.all(
              Radius.circular(inputRadius),
            ),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        // Password // keyboardType: TextInputType.visiblePassword,

        obscureText: inputObscureText,
        textInputAction: TextInputAction.next,
        // Password //textInputAction: TextInputAction.done,
      ),
    );
  }
}
