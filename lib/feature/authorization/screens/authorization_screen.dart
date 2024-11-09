import 'package:flutter/material.dart';

import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

/// todo:
/// auslogen info for all TextFormFields
/// logik anschrauben  mit enum [login Pass ezt]
/// abrufen bei name name -> == num von List Fehler!
///
class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  String? loginError;
  String? passwodrError;

  void validateLgn(String? text) {
    if (text == null) {
      setState(() {
        loginError = "Bitte Text eingeben";
      });
    } else if (text.length < 6 && text.isNotEmpty) {
      setState(() {
        loginError = "Korrigieren Sie Ihr Login";
      });
    } else if (text.isEmpty) {
      setState(() {
        loginError = "Bitte Text eingeben";
      });
    } else {
      setState(() {
        loginError = null;
      });
    }
  }

  void _onChangedLgn(String? text) {
    if (loginError != null) {
      setState(() {
        loginError = null;
      });
    }
  }

  void validatePwd(String? text) {
    if (text == null) {
      setState(() {
        passwodrError = "Bitte Text eingeben";
      });
    } else if (text.length < 6 && text.isNotEmpty) {
      setState(() {
        passwodrError = "Korrigieren Sie Ihr Password";
      });
    } else if (text.isEmpty) {
      setState(() {
        passwodrError = "Bitte Text eingeben";
      });
    } else {
      setState(() {
        passwodrError = null;
      });
    }
  }

  void _onChangedPwd(String? text) {
    if (passwodrError != null) {
      setState(() {
        passwodrError = null;
      });
    }
  }

  final controllerLgn = TextEditingController();
  final controllerPwd = TextEditingController();

  void showLongTextDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Information"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
                const SizedBox(height: 20),
                const Text(
                  'Infofrmation for beginer:\n'
                  '1. Lorem ipsum .\n'
                  '2. Lorem ipsum .\n'
                  '...\n'
                  '20. Last event.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Closeь"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
            padding:
                const EdgeInsets.only(top: 130, bottom: 0, left: 0, right: 0),
            child: Form(
              child: Stack(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Positioned(
                      top: 130,
                      left: 75,
                      child: Transform.scale(
                          scale: 1.0,
                          child: Image.asset("assets/images/playwithme.png"))),
                  Positioned(
                    top: 270,
                    left: 10,
                    child: Column(
                      children: [
                        //================================================ LOGIN
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: SizedBox(
                                width: 80,
                                height: 60,
                                child: loginError != null
                                    ? IconButton(
                                        onPressed: () {
                                          showLongTextDialog(loginError!);
                                        },
                                        icon: const Icon(Icons.info),
                                        iconSize: 40,
                                        color: Colors.white,
                                      )
                                    : null, // Если ошибки нет, иконка не отображается
                              ),
                            ),
                            SizedBox(
                              width: 270,
                              height: 80,
                              child: TextFormField(
                                controller: controllerLgn,
                                onChanged: _onChangedLgn,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorWidth: 3.0,
                                cursorHeight: 30.0,
                                cursorErrorColor: Colors.red,
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabled: true,
                                  errorText: loginError,
                                  errorStyle: const TextStyle(
                                      color: Color.fromARGB(255, 204, 219, 2),
                                      fontSize: 12),

                                  // ==  LABEL DECORATION ==
                                  labelText: "Login",
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),

                                  /// == BORDER DECORATION ==
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
                                      color: Colors.white,
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //===================================================

                        const SizedBox(
                          height: 10,
                        ),
                        //=================================================== PASSWORD

//  obscureText: true, //nevidimie
//  obscuringCharacter: '*',
//  kursor
                        SizedBox(
                          width: 300,
                          height: 80,
                          child: TextFormField(
                            controller: controllerPwd,
                            onChanged: _onChangedPwd,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorWidth: 3.0,
                            cursorHeight: 30.0,
                            cursorErrorColor: Colors.red,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabled: true,
                              errorText: passwodrError,
                              errorStyle: const TextStyle(
                                  color: Color.fromARGB(255, 204, 219, 2),
                                  fontSize: 12),

                              // ==  LABEL DECORATION ==
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),

                              /// == BORDER DECORATION ==
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
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),

                        //_________________________________________
                        const SizedBox(height: 15),
                        //_________________________________________
                        const ButtonRegistrieren(),
                        //_________________________________________
                        const SizedBox(height: 150),
                        //_________________________________________
                        //const ButtonEinloggen(),
                        Positioned(
                          top: 570,
                          left: 150,
                          right: 100,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.transparent),
                            ),
                            onPressed: () {
                              validateLgn(controllerLgn.text);
                              validatePwd(controllerPwd.text);

                              if (loginError == null && passwodrError == null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationWrapper()));
                              }
                            },
                            child: Text(
                              "Einloggen",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
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
