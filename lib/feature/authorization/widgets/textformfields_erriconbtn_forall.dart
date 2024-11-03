import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_allertdialog_forall.dart';

class InformationErrorIconButton extends StatelessWidget {
  final String? errorMessage;
  final String fieldName;
  final String dialogContent;

  const InformationErrorIconButton({
    super.key,
    this.errorMessage,
    required this.fieldName,
    required this.dialogContent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: 80,
        height: 60,
        child: errorMessage != null
            ? IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShowInfoTextDialog(
                        message: errorMessage!,
                        fieldName: fieldName,
                        dialogContent: dialogContent,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.info),
                iconSize: 40,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
