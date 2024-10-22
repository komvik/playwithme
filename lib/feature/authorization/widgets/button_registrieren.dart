import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/registration_screen.dart';

class ButtonRegistrieren extends StatelessWidget {
  const ButtonRegistrieren({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RegistrationScreen()));
      },
      //  const RegistrationScreen(),
      child: const Text(
        "Registrieren",
        style:
            TextStyle(fontSize: 16, color: Color.fromARGB(255, 237, 174, 97)),
      ),
    );
  }
}
