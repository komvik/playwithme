import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/logic/validate_functions_to_all_t_f_f.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/registr_extend_profile.dart';

// ignore: must_be_immutable
class CreateProfileButton extends StatelessWidget {
  final TextEditingController controllerPwd;
  final TextEditingController controllerPwdConf;
  final TextEditingController controllerEmail;
  final String? loginError;
  String? passwordError = "";
  String? confirmPwdError = "";
  String? emailError = "";

  CreateProfileButton({
    super.key,
    required this.controllerPwd,
    required this.controllerPwdConf,
    required this.controllerEmail,
    required this.loginError,
    this.passwordError,
    this.confirmPwdError,
    this.emailError,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.transparent),
      ),
      onPressed: () {
        ValidationUtils.validatePassword(controllerPwd.text, (error) {
          passwordError = error;
        });
        ValidationUtils.validatePasswordC(controllerPwdConf.text, (error) {
          confirmPwdError = error;
        });
        ValidationUtils.validateEmail(controllerEmail.text, (error) {
          emailError = error;
        });

        if (loginError == null &&
            passwordError == null &&
            confirmPwdError == null &&
            emailError == null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegistrationDataScreen(
              email: controllerEmail.text,
              password: controllerPwd.text,
            ),
          ));
        }
      },
      child: Text(
        "  Profil erstellen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
