import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/config/theme.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_show_general_info.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/create_input_text_field.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Willkommen,\nSpiel mit uns",
        theme: myTheme,
        home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
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
                  ///

                  Positioned(
                      top: 140,
                      left: 75,
                      child: Transform.scale(
                          scale: 1.0,
                          child: Image.asset("assets/images/playwithme.png"))),
                  Positioned(
                    top: 300,
                    left: 40,
                    child: Column(
                      children: [
                        //____________________________ LOGIN
                        CreateInputTextField(
                          onChange: (value) {},
                          inputWidth: 350,
                          inputHeight: 50,
                          inputRadius: 20.0,
                          label: "Input login",
                          inputObscureText: false,
                        ),
                        const SizedBox(height: 15),
                        //____________________________ PASSWORD
                        CreateInputTextField(
                          onChange: (value) {},
                          inputWidth: 350,
                          inputHeight: 50,
                          inputRadius: 20.0,
                          label: "Input password",
                          inputObscureText: false,
                        ),
//_________________________________________
                        const SizedBox(height: 20),
//_________________________________________
                        const ButtonRegistrieren(),
//_________________________________________
                        const SizedBox(height: 180),
//_________________________________________
                        const ButtonShowGeneralInfo(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
