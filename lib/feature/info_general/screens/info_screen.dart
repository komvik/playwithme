import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(251, 86, 167, 205),
        body: const Center(
          child: Text(
            " General Info ",
            style: TextStyle(fontSize: 48),
          ),
        ),

        ///

        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 234, 211, 161),
          ),
          child: NavigationBar(
            backgroundColor: const Color.fromARGB(255, 238, 240, 245),
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: SizedBox(
                    width: 64,
                    height: 64,
                    child:
                        Image(image: AssetImage("assets/icons/icon_home.png"))),
                selectedIcon: SizedBox(
                    width: 128,
                    height: 128,
                    child:
                        Image(image: AssetImage("assets/icons/icon_home.png"))),
                label: 'Home',
              ),
              NavigationDestination(
                icon: SizedBox(
                    width: 64,
                    height: 64,
                    child: Image(
                        image: AssetImage("assets/icons/icon_players.png"))),
                selectedIcon: SizedBox(
                    width: 128,
                    height: 128,
                    child: Image(
                        image: AssetImage("assets/icons/icon_players.png"))),
                label: 'Spieler',
              ),
              NavigationDestination(
                icon: SizedBox(
                    width: 64,
                    height: 64,
                    child: Image(
                        image: AssetImage("assets/icons/icon_court.png"))),
                selectedIcon: SizedBox(
                    width: 128,
                    height: 128,
                    child: Image(
                        image: AssetImage("assets/icons/icon_court.png"))),
                label: 'Spielfelder',
              ),
              NavigationDestination(
                icon: SizedBox(
                    width: 64,
                    height: 64,
                    child: Image(
                        image: AssetImage("assets/icons/icon_settings.png"))),
                selectedIcon: SizedBox(
                    width: 128,
                    height: 128,
                    child: Image(
                        image: AssetImage("assets/icons/icon_settings.png"))),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
