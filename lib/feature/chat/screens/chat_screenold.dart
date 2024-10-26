import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/chat/widgets/chat_app_bar.dart';
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

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isEmpty) return; // Не отправляем пустые сообщения

    setState(() {
      _messages.insert(0, message); // Добавляем новое сообщение в начало списка
    });
    _controller.clear(); // Очищаем поле ввода
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Устанавливаем светло-розовый фон
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
          // Уменьшение ширины TextField путем добавления ограничения ширины
          Expanded(
            flex: 4, // Пропорционально уменьшает ширину TextField в строке
            child: SizedBox(
              height: 60, // Уменьшаем высоту TextField
              child: TextField(
                controller: controller,
                style: const TextStyle(
                    color: playerDarkBlue), // Цвет вводимого текста
                decoration: InputDecoration(
                  labelText: ' Geben Sie Ihre Nachricht ein...',
                  labelStyle: const TextStyle(
                      color: Colors.lightBlue), // Цвет текста placeholder
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: oceanMeditation, // Цвет рамки
                      width: 2.0, // Толщина рамки
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color:
                          Colors.lightBlue, // Цвет рамки для enabled TextField
                      width: 2.0, // Толщина рамки
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue, // Цвет рамки при фокусе
                      width: 3.5, // Толщина рамки при фокусе
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
