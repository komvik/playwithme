import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/logic/validate_functions_to_all_t_f_f.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/all_errorinfo_textform.dart';
//import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
//import 'package:projekt_481_play_with_me/feature/authorization/repositories/mockdb_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_erriconbtn_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_universalform_forall.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_storage.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final controllerEmail = TextEditingController();
  final controllerAuthPwd = TextEditingController();

  String? emailError;
  String? passwordAuthError;

  //final DatabaseRepositoryPlayer repository = MockdbRepositoryPlayer();

  Future<void> _authenticateUser() async {
    final email = controllerEmail.text;
    final password = controllerAuthPwd.text;

//_______________________________________________________ validate email
    ValidationUtils.validateEmail(email, (error) {
      setState(() {
        emailError = error;
      });
    });
//_______________________________________________________ validate password

    ValidationUtils.validatePassword(password, (error) {
      setState(() {
        passwordAuthError = error;
      });
    });
//_________________________________________________________________________
//
    if (emailError == null && passwordAuthError == null) {
      NavigatorState navigator = Navigator.of(context);
      try {
        //amstatt dass
        // Player? player = await repository.getPlayerByEmail(email);
        //sreibe ich
        Player? player = await PlayerStorage.getPlayerByEmail(email);

        if (player != null && player.password == password) {
          navigator.pushReplacement(
            MaterialPageRoute(builder: (context) => const NavigationWrapper()),
          );
        } else {
          setState(() {
            passwordAuthError = "Incorrect login or password";
          });
        }
      } catch (e) {
        setState(() {
          emailError = "Error during authorization";
        });
      }
    }
  }
//_________________________________________________________________________

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
                  top: 260,
                  right: 40,
                  child: Column(
                    children: [
                      //======================================= E-Mail as login
                      Row(
                        children: [
                          InformationErrorIconButton(
                            // emailError als null oder not null
                            // show or hidden icon
                            errorMessage: emailError,
                            fieldName: fields[3].fieldName,
                            dialogContent: fields[3].dialogContext,
                          ),
                          AdaptiveTextFormField(
                            setWidth: 300,
                            controller: controllerEmail,
                            errorText: emailError,
                            labelText: "Email",
                            onChanged: (text) {
                              ValidationUtils.onChangedEmail(text, (error) {
                                setState(() {
                                  emailError = error;
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
                            fieldName: fields[1].fieldName,
                            dialogContent: fields[1].dialogContext,
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
