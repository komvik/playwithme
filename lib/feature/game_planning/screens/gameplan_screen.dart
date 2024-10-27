import 'package:flutter/material.dart';
//import 'package:intl/intl.dart'; // Пакет для работы с форматированием времени
//import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';

class GamePlanningScreen extends StatefulWidget {
  const GamePlanningScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GamePlanningScreenState createState() => _GamePlanningScreenState();
}

class _GamePlanningScreenState extends State<GamePlanningScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final int selectedPlayers = 1;

  // Выбор времени с помощью TimePicker
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  // Метод для подтверждения данных
  void _confirmGameDetails() {
    final String location = _locationController.text;
    final String time = _timeController.text;

    if (location.isEmpty || time.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte füllen Sie alle Felder aus')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Das Spiel findet auf dem Feld \n $location \n Startzeit $time'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Spielplanung", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),

            // Выбор времени
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Startzeit',
                hintText: 'Wählen Sie die Uhrzeit aus',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => _pickTime(context),
                ),
              ),
              readOnly: true,
            ),

            const SizedBox(height: 16),

            // Ввод места проведения
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Veranstaltungsort',
                hintText: 'Geben Sie den Namen oder die Adresse der Site ein',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Кнопка для подтверждения
            ElevatedButton(
              onPressed: _confirmGameDetails,
              child: const Text('Bestätigen'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
