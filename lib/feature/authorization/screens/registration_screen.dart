import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/registration_data_screen.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/create_input_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/registrieren.png"),
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
//____________________________ Login
                Positioned(
                  top: 250,
                  left: 100,
                  child: CreateInputTextField(
                    onChange: (value) {},
                    inputHeight: 50,
                    inputWidth: 280,
                    inputRadius: 20.0,
                    label: "Login erstellen",
                    inputObscureText: false,
                  ),
                ),
//____________________________ E-mail
                Positioned(
                  top: 310,
                  left: 10,
                  child: CreateInputTextField(
                    onChange: (value) {},
                    inputHeight: 50,
                    inputWidth: 370,
                    inputRadius: 20.0,
                    label: "E-Mail erstellen",
                    inputObscureText: false,
                  ),
                ),
//____________________________ Input pass
                Positioned(
                  top: 370,
                  left: 100,
                  child: CreateInputTextField(
                    onChange: (value) {},
                    inputHeight: 50,
                    inputWidth: 280,
                    inputRadius: 20.0,
                    label: "Passwort erstellen",
                    inputObscureText: false,
                  ),
                ),
//____________________________ Widerhollen pass
                Positioned(
                  top: 430,
                  left: 100,
                  child: CreateInputTextField(
                    onChange: (value) {},
                    inputHeight: 50,
                    inputWidth: 280,
                    inputRadius: 20.0,
                    label: "Passwort wiederholen",
                    inputObscureText: false,
                  ),
                ),
                //_____________
                Positioned(
                  top: 642,
                  left: 110,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationDataScreen()));
                    },
                    child: Text(
                      "      Profil erstellen",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                //_________________________________________
              ],
            ),
          ),
        ));
  }
}
