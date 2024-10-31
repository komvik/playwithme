import 'package:flutter/material.dart';

//import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_einloggen.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//_______________ Valid LOGIN1
  String? isValidLogin(String? value) {
    if (focusNodeLGN.hasFocus) return null;
    if (value == null || value.isEmpty) {
      return "Bitte ein text angeben";
    }
    if (value.length < 4) {
      return "Geben Sie mindestens vier Zeichen ein";
    }
    return null;
  }

  //_______________ Valid LOGIN2
  String? isValidLogin2(String? value) {
    if (value == null || value.isEmpty) {
      return "Bitte ein text angeben";
    }
    if (value.contains("1")) {
      return "cont 1";
    }

    return null;
  }

  void _resetErrorState() {
    // Вызовем validate для всех полей формы
    // _formKey.currentState!.validate();
    _formKey.currentState!.reset();
  }

  String? emailError;

  void validateEmail(String? text) {
    if (text == null) {
      setState(() {
        emailError = "Bitte Text eingeben";
      });
    } else if (text.length < 4) {
      setState(() {
        emailError = "Bitte mindestens 4 Zeichen eingeben";
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
  }

  void _onChanged(String? text) {
    if (emailError != null) {
      setState(() {
        emailError = null;
      });
    }
  }

  final controllerLgn = TextEditingController();
  final controllerPwd = TextEditingController();
  final focusNodeLGN = FocusNode();
  final focusNodePWD = FocusNode();

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
            child: Form(
              //key: _formKey,
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
                        //================================================ LOGIN
                        SizedBox(
                          width: 300,
                          height: 80,
                          child: TextFormField(
                            focusNode: focusNodeLGN,
                            controller: controllerLgn,
                            onChanged: _onChanged,
//  obscureText: true, //nevidimie
//  obscuringCharacter: '*',
//  kursor
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorWidth: 3.0,
                            cursorHeight: 30.0,
                            //  cursorRadius: const Radius.circular(30.0),
                            cursorErrorColor: Colors.red,
                            cursorColor: Colors.white,

//    keyboardType: TextInputType.number, // zifri
//    keyboardType: TextInputType.datetime, //zifri && simvoli
//    keyboardType: TextInputType.numberWithOptions(),

//    textInputAction: TextInputAction.next, //perehod
                            textInputAction: TextInputAction.next,

                            validator: isValidLogin,

                            decoration: InputDecoration(
                              enabled: true,
                              errorText: emailError,

                              hintStyle: const TextStyle(
                                  color: Colors.red, fontSize: 15),
                              //_ label _
                              labelText: "Login",
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        //===================================================

                        const SizedBox(
                          height: 15,
                        ),
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
                        const SizedBox(height: 80),
                        //_________________________________________
                        //const ButtonEinloggen(),

                        Positioned(
                          top: 570,
                          left: 145,
                          right: 110,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.transparent),
                            ),
                            onPressed: () async {
                              /*FocusScope.of(context).unfocus();
                              await Future.delayed(
                                  const Duration(milliseconds: 100));

                              if (_formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Center(
                                //         child: Text(
                                //             "Daten erfolgreich gespeichert.")),
                                //   ),
                                // );
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationWrapper()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    margin: EdgeInsets.only(bottom: 70.0),
                                    content: Center(
                                        child: Text(
                                            "Daten müssen korrigiert werden.")),
                                  ),
                                );
                              }*/
                              validateEmail(controllerLgn.text);
                              if (emailError != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    margin: EdgeInsets.only(bottom: 70.0),
                                    content: Center(
                                        child: Text(
                                            "Daten müssen korrigiert werden.")),
                                  ),
                                );
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationWrapper()));
                              }
                            },
                            child: const Text(
                              "Einloggen",
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
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
