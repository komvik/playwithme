import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';
import 'package:projekt_481_play_with_me/feature/chat/screens/chat_screen.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationAppBar({
    super.key,
  });

  // TODO: implement preferredSize
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        //___________________________________________________CHAT
        IconButton(
          icon: Image.asset(
            'assets/icons/icon_groupchat.png',
            width: 44,
            height: 44,
            fit: BoxFit.cover,
          ),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return const ChatScreen();
              },
            ));
          },
        ),
        //_____________________________________________ ONLINE
        Expanded(
          flex: 3,
          child: IconButton(
            icon: Image.asset(
              'assets/icons/icon_player_online.png',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Zeigt die Anzahl der Spieler online an')));
            },
          ),
        ),
        //______________________________________________ EXIT
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
        //
      ],
    );
  }
}
