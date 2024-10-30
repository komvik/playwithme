import 'package:flutter/material.dart';

import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_einloggen.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      // //____________________________ LOGIN
                      // CreateInputTextField(
                      //   onChange: (value) {},
                      //   inputWidth: 350,
                      //   inputHeight: 50,
                      //   inputRadius: 20.0,
                      //   label: "Input login",
                      //   inputObscureText: false,
                      // ),
                      // const SizedBox(height: 15),
                      // //____________________________ PASSWORD
                      // CreateInputTextField(
                      //   onChange: (value) {},
                      //   inputWidth: 350,
                      //   inputHeight: 50,
                      //   inputRadius: 20.0,
                      //   label: "Input password",
                      //   inputObscureText: false,
                      // ),

//=============================================================================== LOGIN
                      SizedBox(
                        width: 300,
                        height: 80,
                        child: TextField(
                          //-------------------------InputDecoration
                          decoration: InputDecoration(
                            enabled: true,
                            //errorText: "",
                            //_ label _
                            labelText: "Login",
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),

                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 253, 29, 29),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 253, 29, 29),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
//===================================================
                      const SizedBox(height: 15),
//=================================================== PASSWORD
                      const SizedBox(
                        width: 350,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            // filled: true,
                            fillColor: Colors.white,
                            labelText: " Password",
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),

//_________________________________________
                      const SizedBox(height: 20),
//_________________________________________
                      const ButtonRegistrieren(),
//_________________________________________
                      const SizedBox(height: 185),
//_________________________________________
                      const ButtonEinloggen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
