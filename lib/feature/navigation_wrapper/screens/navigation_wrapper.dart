import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/info_fields/screens/info_fields_screen.dart';
import 'package:projekt_481_play_with_me/feature/info_general/info_general.dart';
import 'package:projekt_481_play_with_me/feature/info_players/screens/info_players_screen.dart';
import 'package:projekt_481_play_with_me/feature/settings/screens/settings_screen.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _selectedIndex = 0;

  // InfoGeneralScreen -> screens[_selectedIndex] -> InfoGeneralScreen -> screens[_selectedIndex] ->

  final List<Widget> screens = [
    const InfoGeneralScreen(),
    const InfoPlayersScreen(),
    const InfoFieldsScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(251, 86, 167, 205),
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
            //__________________________________________________ Homfe

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
            //__________________________________________________ Players

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
            //__________________________________________________ Courts

            NavigationDestination(
              icon: SizedBox(
                  width: 64,
                  height: 64,
                  child:
                      Image(image: AssetImage("assets/icons/icon_court.png"))),
              selectedIcon: SizedBox(
                  width: 128,
                  height: 128,
                  child:
                      Image(image: AssetImage("assets/icons/icon_court.png"))),
              label: 'Spielfelder',
            ),
            //__________________________________________________ Settings

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
      body: Center(
        child: screens[_selectedIndex],
      ),
    );
  }
}
