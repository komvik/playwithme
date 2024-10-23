import 'package:flutter/material.dart';

import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';

import 'package:projekt_481_play_with_me/feature/authorization/widgets/create_input_text_field.dart';
import 'package:projekt_481_play_with_me/config/theme.dart';

class RegistrationDataScreen extends StatelessWidget {
  const RegistrationDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              scale: 0.5,
              image: AssetImage("assets/images/background3.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Container(
          width: 430,
          height: 900,
          //color: const Color.fromARGB(0, 163, 25, 25),
          padding:
              const EdgeInsets.only(top: 130, bottom: 0, left: 0, right: 0),
          //
          child: Stack(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              const Positioned(
                top: 50,
                left: 180,
                child: Text("AVATAR"),
              ),
//____________________________ name
              Positioned(
                top: 250,
                left: 40,
                child: CreateInputTextField(
                  onChange: (value) {},
                  inputHeight: 50,
                  inputWidth: 350,
                  inputRadius: 10.0,
                  label: "Geben Sie Ihren Namen ein",
                  inputObscureText: false,
                ),
              ),
//____________________________ Nachname
              Positioned(
                top: 310,
                left: 40,
                child: CreateInputTextField(
                  onChange: (value) {},
                  inputHeight: 50,
                  inputWidth: 350,
                  inputRadius: 10.0,
                  label: "Geben Sie Ihren Nachnamen ein",
                  inputObscureText: false,
                ),
              ),
//____________________________ Spitzname

              const Positioned(
                top: 400,
                left: 320,
                child: Text(
                  "optional",
                  style: TextStyle(color: Color.fromARGB(255, 213, 226, 228)),
                ),
              ),
              Positioned(
                top: 420,
                left: 40,
                child: CreateInputTextField(
                  onChange: (value) {},
                  inputHeight: 50,
                  inputWidth: 350,
                  inputRadius: 10.0,
                  label: "Geben Sie Ihren Spitznamen ein",
                  inputObscureText: false,
                ),
              ),
//____________________________ Widerhollen pass

              //_____________
              Positioned(
                top: 640,
                left: 135,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AuthorizationScreen()));
                  },
                  child: const Text(
                    " Profil speichern",
                  ),
                ),
              ),
              //_________________________________________
            ],
          ),
        ),
      ),
    ));
  }
}
