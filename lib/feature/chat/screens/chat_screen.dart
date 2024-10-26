import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/chat/widgets/chat_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChatAppBar(),
      body: Center(
        child: Text(
          'This is the CHAT page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
