import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/logic/validate_functions_to_all_t_f_f.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/errorinfo_all_textform.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/create_profile_button.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_erriconbtn_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_universalform_forall.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final controllerPwd = TextEditingController();
  final controllerPwdConf = TextEditingController();
  final controllerEmail = TextEditingController();

  String? loginError;
  String? passwordError;
  String? confirmPwdError;
  String? emailError;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/new_background.png"),
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
                  Column(
                    children: [
                      //=========================== EMAIL
                      Row(
                        children: [
                          InformationErrorIconButton(
                            errorMessage: emailError,
                            fieldName: fields[3].fieldName,
                            dialogContent: fields[3].dialogContext,
                          ),
                          AdaptiveTextFormField(
                            setWidth: 300,
                            controller: controllerEmail,
                            errorText: emailError,
                            labelText: "E-mail",
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
                      //========================= PASSWORD
                      Row(
                        children: [
                          InformationErrorIconButton(
                            errorMessage: passwordError,
                            fieldName: fields[1].fieldName,
                            dialogContent: fields[1].dialogContext,
                          ),
                          AdaptiveTextFormField(
                            setWidth: 300,
                            controller: controllerPwd,
                            errorText: passwordError,
                            labelText: "Password",
                            onChanged: (text) {
                              ValidationUtils.onChangedPassword(text, (error) {
                                setState(() {
                                  passwordError = error;
                                });
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      //========================== PASSWORD CONFIRM
                      Row(
                        children: [
                          InformationErrorIconButton(
                            errorMessage: confirmPwdError,
                            fieldName: fields[2].fieldName,
                            dialogContent: fields[2].dialogContext,
                          ),
                          AdaptiveTextFormField(
                            setWidth: 300,
                            controller: controllerPwdConf,
                            errorText: confirmPwdError,
                            labelText: "Password widerhollen",
                            onChanged: (text) {
                              ValidationUtils.onChangedPassword(text, (error) {
                                setState(() {
                                  confirmPwdError = error;
                                });
                              });
                            },
                          ),
                        ],
                      ),

                      CreateProfileButton(
                        controllerPwd: controllerPwd,
                        controllerPwdConf: controllerPwdConf,
                        controllerEmail: controllerEmail,
                        loginError: loginError,
                        passwordError: passwordError,
                        confirmPwdError: confirmPwdError,
                        emailError: emailError,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
