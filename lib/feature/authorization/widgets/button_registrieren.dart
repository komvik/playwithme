import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/registr_create_profile.dart';

//  the "Registrieren" button belongs to the "authorization_screen"

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
        child: Text(
          "Registrieren",
          style: Theme.of(context).textTheme.titleLarge,
        ));
  }
}
