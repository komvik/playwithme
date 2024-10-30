import 'package:flutter/material.dart';
//import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';
//import 'package:projekt_481_play_with_me/config/colors.dart';
import 'package:projekt_481_play_with_me/feature/info_courts/repositories/court_data.dart';
//import 'package:projekt_481_play_with_me/feature/info_players/repositories/player_data.dart';

class InfoGeneralScreen extends StatelessWidget {
  const InfoGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(100, 42, 105, 116),
          width: 400,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informationen zum letzten geplanten Spiel",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "Zeit: 10:00",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Anzahl der Spieler: 6",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Status: [Ja, vielleicht, Nein]",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Новая секция для отображения площадок
        Container(
          color: const Color.fromARGB(62, 0, 0, 0),
          width: 400,
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: courts.length,
            itemBuilder: (BuildContext context, int index) {
              final court = courts[index]; // Получаем детали площадки
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.7,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromARGB(255, 236, 250, 255),
                                Color.fromARGB(255, 97, 96, 105),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name: ${court.name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "URL : ${court.locationUrl}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  court.imageUrl,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                  width: 280,
                  height: 260,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          court.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              court.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Hier können Sie bei Bedarf einen zusätzlichen Abschnitt hinzufügen
      ],
    );
  }
}
