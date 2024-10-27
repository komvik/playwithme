import 'package:flutter/material.dart';
//import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';
import 'package:projekt_481_play_with_me/config/colors.dart';

class InfoGeneralScreen extends StatelessWidget {
  const InfoGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   color: const Color.fromARGB(0, 0, 0, 0),
        //   width: 400,
        //   height: 40,
        //   child: Row(
        //     children: [
        //       const Image(image: AssetImage("assets/images/player_online.png")),
        //       Expanded(
        //         flex: 4,
        //         child: Text(
        //           "10 Spieler online ",
        //           style: Theme.of(context)
        //               .textTheme
        //               .headlineSmall
        //               ?.copyWith(color: const Color.fromARGB(255, 3, 41, 4)),
        //         ),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: GestureDetector(
        //             onTap: () {
        //               Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => const AuthorizationScreen()));
        //             },
        //             child: Text(
        //               "Exit",
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .headlineSmall
        //                   ?.copyWith(color: Colors.white),
        //             )),
        //       ),
        //     ],
        //   ),
        // ),
//

        Container(
          color: const Color.fromARGB(100, 42, 105, 116),
          width: 400,
          height: 480,
          child: Text(
            "Info \n"
            "Zu dem Spiel, das auf der Liste an erster Stelle steht\n"
            "Zeit:   ab Wann Begin\n"
            "                                   Anzahl der Spieler\n"
            "                                  [Ja, Vielleicht, Nein] \n",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),

        Container(
          color: const Color.fromARGB(29, 0, 0, 0),
          width: 400,
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: 3, //cardData.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  //
                },
                child: SizedBox(
                  width: 170,
                  height: 30,
                  child: Card(
                    color: const Color.fromARGB(236, 4, 44, 71),
                    child: Text(
                      "    Spiel ",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
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
                  //
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
                  child: const Card(
                    // playerDarkBlue
                    color: playerDarkBlue,
///////
                    ///
                    ///
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Image(
                              image:
                                  AssetImage("assets/images_courts/JKB.png")),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("123",
                                      //  textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  Text(
                                    "abc",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "56",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                      SizedBox(
                                          width: 14,
                                          height: 14,
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images_courts/JKB.png"))),
                                      Text(
                                        "200",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //
                      ],
                    ),

                    //  Text(
                    //   "   Feld",
                    //   style: Theme.of(context).textTheme.labelLarge,
                    // ),
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
