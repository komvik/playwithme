import 'package:flutter/material.dart';

class InfoFieldsScreen extends StatelessWidget {
  const InfoFieldsScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(113, 0, 0, 0),
          width: 400,
          height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Container     Steuerung ",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "\n                        Füge mich zum Spiel hinzu."
                " Lege meinen Status fest\n"
                " \n",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 220),
              Text(
                "                                 "
                "                                Feld   Adresse \n",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),

        ///
        ///

        ///
        ///
        Container(
          color: const Color.fromARGB(62, 0, 0, 0),
          width: 400,
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: 4, //cardData.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // showModalBottomSheet(
                  //     context: context,
                  //     isScrollControlled: true,
                  //     clipBehavior: Clip.none,
                  //     builder: (context) {
                  //        return  DetailedInfoScreen(item: cardData[index]);
                  //     });
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 236, 250, 255),
                        Color.fromARGB(255, 97, 96, 105),
                      ],
                    ),
                  ),
                  width: 140,
                  height: 130,
                  child: Card(
                    // playerDarkBlue
                    //color: Colors.playerDarkBlue,

                    color: const Color.fromARGB(236, 4, 44, 71),

                    child: Text(
                      "   Feld",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
