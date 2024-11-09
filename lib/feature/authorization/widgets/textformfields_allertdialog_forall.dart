import 'package:flutter/material.dart';

class ShowInfoTextDialog extends StatelessWidget {
  final String message;
  final String fieldName;
  final String dialogContent; // ist implements String

  const ShowInfoTextDialog({
    super.key,
    required this.message,
    required this.fieldName,
    required this.dialogContent,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Feldeingaberegeln für $fieldName"),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(message),
            const SizedBox(height: 20),
            Text(
              dialogContent,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Schließen"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
