import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

class ButtonShowGeneralInfo extends StatelessWidget {
  const ButtonShowGeneralInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NavigationWrapper()));
      },
      child: const Text(
        "     Einloggen",
        style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(173, 221, 151, 45)),
      ),
    );
  }
}
