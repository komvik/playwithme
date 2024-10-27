import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/info_courts/repositories/court_data.dart';
import 'package:projekt_481_play_with_me/config/colors.dart';

//lib/feature/info_courts/repositories/court_data.dart/';

class InfoFieldsScreen extends StatelessWidget {
  const InfoFieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Information header with dynamic court info
        Container(
          color: const Color.fromARGB(113, 0, 0, 0),
          width: 400,
          height: 380,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  Spielinformationen",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: oliveLeaf),
              ),

              // Display information for each court in a Row at the top
              Expanded(
                child: ListView.builder(
                  itemCount: courts.length,
                  itemBuilder: (context, index) {
                    final court = courts[index];
                    return Container(
                      color:
                          getColorForCourt(index), // Use two colors for courts
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${court.name}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: deepKelp),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Location URL: ${court.locationUrl}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: deepKelp),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Spieler: ${court.playerCount}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: deepKelp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Horizontal ListView of court cards
        Container(
          color: const Color.fromARGB(62, 0, 0, 0),
          width: 400,
          height: 280, // Height of the card container
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: courts.length, // Dynamic length based on courts list
            itemBuilder: (BuildContext context, int index) {
              final court = courts[index];
              return GestureDetector(
                onTap: () {
                  // Show modal bottom sheet on card tap
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.7, // Sets modal height to 70% of screen
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
                              // Court name and location URL at the top
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
                                      "Location URL: ${court.locationUrl}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              // Centered image without side padding
                              Expanded(
                                child: Image.asset(
                                  court.imageUrl,
                                  width: double.infinity, // Full width
                                  fit: BoxFit
                                      .cover, // Scales the image to cover the entire space
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
                  width: 280, // Width of the card
                  height: 260, // Height of the card
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Full-size image
                        Image.asset(
                          court.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        // Court name overlay
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
        Text(
          " Lege meinen Status fest",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }

  // Method to return a color for each court based on the index (even and odd)
  Color getColorForCourt(int index) {
    return index % 2 == 0 ? headInTheClouds : silkenTofu;
  }
}
