import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/config/colors.dart';

class InputNewTextMessageField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback sendMessage;

  const InputNewTextMessageField({
    super.key,
    required this.controller,
    required this.sendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 10, 40),
      child: Row(
        children: [
          Expanded(
            flex: 4, // Proportionally reduces width of the TextField in row
            child: SizedBox(
              height: 60,
              child: TextField(
                controller: controller,
                style: const TextStyle(color: playerDarkBlue),
                decoration: InputDecoration(
                  labelText: 'Geben Sie Ihre Nachricht ein...',
                  labelStyle: const TextStyle(color: Colors.lightBlue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 3.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons_chat/send_message.png',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
            ),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
