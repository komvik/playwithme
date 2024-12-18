import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/logic/validate_functions_to_all_t_f_f.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/registr_extend_profile.dart';

// ignore: must_be_immutable
class ButtonCreateProfile extends StatefulWidget {
  final TextEditingController controllerPwd;
  final TextEditingController controllerPwdConf;
  final TextEditingController controllerEmail;
//
  String? passwordError = "";
  String? confirmPwdError = "";
  String? emailError = "";

  ButtonCreateProfile({
    super.key,
    required this.controllerPwd,
    required this.controllerPwdConf,
    required this.controllerEmail,
    //
    this.passwordError,
    this.confirmPwdError,
    this.emailError,
  });

  @override
  State<ButtonCreateProfile> createState() => _ButtonCreateProfileState();
}

class _ButtonCreateProfileState extends State<ButtonCreateProfile> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.transparent),
      ),
      onPressed: () {
        ValidationUtils.validatePassword(widget.controllerPwd.text, (error) {
          widget.passwordError = error;
        });
        ValidationUtils.validatePasswordC(widget.controllerPwdConf.text,
            (error) {
          widget.confirmPwdError = error;
        });
        ValidationUtils.validateEmail(widget.controllerEmail.text, (error) {
          widget.emailError = error;
        });

        if (widget.passwordError == null &&
            widget.confirmPwdError == null &&
            widget.emailError == null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegistrationDataScreen(
              email: widget.controllerEmail.text,
              password: widget.controllerPwd.text,
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
