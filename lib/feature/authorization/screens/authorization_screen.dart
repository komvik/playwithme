import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/mockdb_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_erriconbtn_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_universalform_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/functions/validate_func_forall_textfields.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_profile.dart';
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

  final DatabaseRepositoryPlayer repository = MockdbRepositoryPlayer();

  Future<void> _authenticateUser() async {
    final login = controllerAuthLgn.text;
    final password = controllerAuthPwd.text;

    ValidationUtils.validateLogin(login, (error) {
      setState(() {
        loginAuthError = error;
      });
    });

    ValidationUtils.validatePassword(password, (error) {
      setState(() {
        passwordAuthError = error;
      });
    });

    if (loginAuthError == null && passwordAuthError == null) {
      try {
        PlayerProfile? player = await repository.getPlayerByLogin(login);

        // if (player != null && player.password == password) { !!!!!!!!
        if (player != null) {
          // ignore: use_build_context_synchronously !!!!!!!!!!!
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NavigationWrapper()),
          );
        } else {
          setState(() {
            passwordAuthError = "Incorrect login or password";
          });
        }
      } catch (e) {
        setState(() {
          loginAuthError = "Error during authorization";
        });
      }
    }
  }

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
                      //========================================= LOGIN
                      Row(
                        children: [
                          InformationErrorIconButton(
                            errorMessage: loginAuthError,
                            fieldName: "Login",
                            dialogContent: "Error Login",
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
                      //========================================= PASSWORD
                      Row(
                        children: [
                          InformationErrorIconButton(
                            errorMessage: passwordAuthError,
                            fieldName: "Password",
                            dialogContent: "Error Pass",
                          ),
                          AdaptiveTextFormField(
                            controller: controllerAuthPwd,
                            errorText: passwordAuthError,
                            labelText: "Password",
                            onChanged: (text) {
                              ValidationUtils.onChangedPassword(text, (error) {
                                setState(() {
                                  passwordAuthError = error;
                                });
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 470,
                  left: 120,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    onPressed: _authenticateUser,
                    child: Text(
                      "Einloggen",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                const Positioned(
                  top: 650,
                  left: 160,
                  child: ButtonRegistrieren(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
