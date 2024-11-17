import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/repo_to_all_text_form_fields.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_erriconbtn_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_universalform_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/validate_functions_to_all_t_f_f.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final controllerAuthLgn = TextEditingController();
  final controllerAuthPwd = TextEditingController();

  String? loginAuthError;
  String? passwordAuthError;

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
            padding:
                const EdgeInsets.only(top: 130, bottom: 0, left: 0, right: 0),
            child: Form(
              child: Stack(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Positioned(
                    top: 270,
                    left: 10,
                    child: Column(
                      children: [
                        //================================================ LOGIN
                        Row(
                          children: [
                            InformationErrorIconButton(
                              errorMessage: loginAuthError,
                              fieldName: fields[0].fieldName,
                              dialogContent: fields[0].dialogContext,
                            ),
                            AdaptiveTextFormField(
                              controller: controllerAuthLgn,
                              errorText: loginAuthError,
                              labelText: "Login",
                              onChanged: (text) {
                                ValidationUtils.onChangedLogin(text, (error) {
                                  setState(() {
                                    loginAuthError = error;
                                  });
                                });
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        //============================================ PASSWORD
                        Row(
                          children: [
                            InformationErrorIconButton(
                              errorMessage: passwordAuthError,
                              fieldName: fields[1].fieldName,
                              dialogContent: fields[1].dialogContext,
                            ),
                            AdaptiveTextFormField(
                              controller: controllerAuthPwd,
                              errorText: passwordAuthError,
                              labelText: "Password",
                              onChanged: (text) {
                                ValidationUtils.onChangedPassword(text,
                                    (error) {
                                  setState(() {
                                    passwordAuthError = error;
                                  });
                                });
                              },
                            ),
                          ],
                        ),

                        //_________________________________________
                        const SizedBox(height: 15),
                        //_________________________________________
                        const ButtonRegistrieren(),
                        //_________________________________________
                        const SizedBox(height: 80),
                        //_________________________________________
                        //const ButtonEinloggen(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 570,
                    left: 120,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      onPressed: () {
                        ValidationUtils.validateLogin(controllerAuthLgn.text,
                            (error) {
                          setState(() {
                            loginAuthError = error;
                          });
                        });
                        ValidationUtils.validatePassword(controllerAuthPwd.text,
                            (error) {
                          setState(() {
                            passwordAuthError = error;
                          });
                        });

                        if (loginAuthError == null &&
                            passwordAuthError == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NavigationWrapper()));
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
          ),
        ));
  }
}
