import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:projekt_481_play_with_me/config/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = []; // Список для хранения сообщений
  final _controller = TextEditingController(); // Контроллер для текстового поля

  // Небольшой репозиторий ответов для бота
  final List<String> _botReplies = [
    "Hallo! Wie kann ich dir helfen?",
    "Interessanter Gedanke!",
    "Lass uns das näher besprechen.",
    "Was möchtest du noch wissen?",
    "Das ist eine großartige Frage!",
    "Ich freue mich, dass du hier bist!",
    "Erzähl weiter, ich bin gespannt!",
    "Gute Idee!",
    "Danke für deine Frage!",
    "Das klingt spannend!",
  ];

  // Функция для отправки сообщения
  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isEmpty) return; // Не отправляем пустые сообщения

    setState(() {
      _messages.insert(0, "Du: $message"); // Добавляем сообщение пользователя
    });
    _controller.clear(); // Очищаем поле ввода

    _sendBotReply(); // Генерация ответа от бота
  }

  // Функция для создания автоответа от бота
  void _sendBotReply() {
    final random = Random();
    final botMessage =
        _botReplies[random.nextInt(_botReplies.length)]; // Случайный ответ

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.insert(0,
            "Player: $botMessage"); // Добавляем ответ бота в список сообщений
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headInTheClouds, // Устанавливаем светло-розовый фон
      appBar: const ChatAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              hydration, // Верхний цвет - розовый
              Colors.white, // Нижний цвет - белый
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // Чтобы новое сообщение отображалось сверху
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: _messages[index]);
                },
              ),
            ),
            NewMessageField(
              controller: _controller,
              sendMessage: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class NewMessageField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback sendMessage;

  const NewMessageField({
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
            flex: 4, // Пропорционально уменьшает ширину TextField в строке
            child: SizedBox(
              height: 60, // Уменьшаем высоту TextField
              child: TextField(
                controller: controller,
                style: const TextStyle(
                    color: playerDarkBlue), // Цвет вводимого текста
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

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Chat"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
