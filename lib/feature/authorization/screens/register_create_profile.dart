import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/repo_to_all_text_form_fields.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/register_extend_profile.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/information_error_icon_button.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/validate_functions_to_all_t_f_f.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final controllerLgn = TextEditingController();
  final controllerPwd = TextEditingController();
  String? loginError;
  String? passwordError;

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
            child: Form(
              child: Stack(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Positioned(
                    top: 250,
                    left: 10,
                    child: Column(
                      children: [
                        //================================================ LOGIN
                        Row(
                          children: [
                            InformationErrorIconButton(
                              errorMessage: loginError,
                              fieldName: fields[0].fieldName,
                              dialogContent: fields[0].dialogContext,
                            ),
                            SizedBox(
                              width: 270,
                              height: 80,
                              child: TextFormField(
                                controller: controllerLgn,
                                onChanged: (text) =>
                                    ValidationUtils.onChangedLogin(text,
                                        (error) {
                                  setState(() {
                                    loginError = error;
                                  });
                                }),
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

                        const SizedBox(height: 5),
                        //=================================================== PASSWORD
                        Row(
                          children: [
                            InformationErrorIconButton(
                              errorMessage: passwordError,
                              fieldName: fields[1].fieldName,
                              dialogContent: fields[1].dialogContext,
                            ),
                            SizedBox(
                              width: 270,
                              height: 80,
                              child: TextFormField(
                                controller: controllerPwd,
                                onChanged: (text) =>
                                    ValidationUtils.onChangedPassword(text,
                                        (error) {
                                  setState(() {
                                    passwordError = error;
                                  });
                                }),
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
                                  errorText: passwordError,
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
                          ],
                        ),
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
                              ValidationUtils.validateLogin(controllerLgn.text,
                                  (error) {
                                setState(() {
                                  loginError = error;
                                });
                              });
                              ValidationUtils.validatePassword(
                                  controllerPwd.text, (error) {
                                setState(() {
                                  passwordError = error;
                                });
                              });

                              if (loginError == null && passwordError == null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationDataScreen()));
                              }
                            },
                            child: Text(
                              "  Profil erstellen",
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
