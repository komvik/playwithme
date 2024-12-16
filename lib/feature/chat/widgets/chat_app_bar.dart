import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/authent_registr_profile.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Wer ist Online'),
      leading: IconButton(
        icon: Image.asset(
          'assets/icons/icon_undo.png',
          width: 44,
          height: 44,
          fit: BoxFit.cover,
        ),
        tooltip: 'Show Snackbar',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/icons/icon_exit.png',
            width: 44,
            height: 44,
            fit: BoxFit.cover,
          ),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AuthorizationScreen()));
          },
        ),
      ],
    );
  }
}
