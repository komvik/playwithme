import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/create_input_text_field.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/avatar_images.dart';

class RegistrationDataScreen extends StatefulWidget {
  const RegistrationDataScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationDataScreenState createState() => _RegistrationDataScreenState();
}

class _RegistrationDataScreenState extends State<RegistrationDataScreen> {
  // Variable to store the selected avatar
  String _selectedAvatar = 'assets/images_avatar/avatar1.png'; // Default

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          scale: 0.5,
          image: AssetImage("assets/images/background3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Container(
          width: 430,
          height: 900,
          padding:
              const EdgeInsets.only(top: 130, bottom: 0, left: 0, right: 0),
          child: Stack(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              const Positioned(
                top: 1,
                left: 300,
                child: Text(
                  "optional",
                  style: TextStyle(color: Color.fromARGB(255, 213, 226, 228)),
                ),
              ),
              const Positioned(
                top: 15,
                left: 130,
                child: Text("Erstellen Sie ein Avatar"),
              ),
              Positioned(
                top: 50,
                left: 130,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: ExactAssetImage(_selectedAvatar),
                ),
              ),
              //___________________________ List Avatar
              Positioned(
                top: 220,
                left: 85,
                child: SizedBox(
                  width: 250,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: avatars.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAvatar = avatars[index];

                            /// Update the selected avatar
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: ExactAssetImage(avatars[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              //____________________________ name
              Positioned(
                top: 310,
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
                top: 370,
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
                top: 420,
                left: 320,
                child: Text(
                  "optional",
                  style: TextStyle(color: Color.fromARGB(255, 213, 226, 228)),
                ),
              ),
              Positioned(
                top: 440,
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
              Positioned(
                top: 645,
                left: 140,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AuthorizationScreen()));
                  },
                  child: Text(
                    " Profil speichern",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              //_________________________________________
            ],
          ),
        ),
      ),
    );
  }
}
