import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/mockdb_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/button_registrieren.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_erriconbtn_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/textformfields_universalform_forall.dart';
import 'package:projekt_481_play_with_me/feature/authorization/widgets/validate_functions_to_all_t_f_f.dart';
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

  // Создаем экземпляр репозитория для работы с данными игроков
  final DatabaseRepositoryPlayer repository =
      MockdbRepositoryPlayer(); // Инициализируем репозиторий

  // Метод для аутентификации
  Future<void> _authenticateUser() async {
    final login = controllerAuthLgn.text;
    final password = controllerAuthPwd.text;

    // Валидация полей с использованием функций из ValidationUtils
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

    // Если ошибок нет, пытаемся авторизовать пользователя
    if (loginAuthError == null && passwordAuthError == null) {
      try {
        // Ищем игрока по логину
        PlayerProfile? player = await repository.getPlayerByLogin(login);

        // if (player != null && player.password == password) {
        if (player != null) {
          // Если пароль совпадает, авторизация прошла успешно
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NavigationWrapper()),
          );
        } else {
          setState(() {
            // Если логин или пароль неверный
            passwordAuthError = 'Неверный логин или пароль';
          });
        }
      } catch (e) {
        setState(() {
          // Обработка ошибок (например, если игрок не найден)
          loginAuthError = 'Ошибка при авторизации';
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
                            dialogContent: "Ошибка при вводе логина",
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
                            dialogContent: "Ошибка при вводе пароля",
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
                      const SizedBox(height: 15),
                      // Button для регистрации
                      const ButtonRegistrieren(),
                      const SizedBox(height: 80),
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
                    onPressed: _authenticateUser, // Вызов авторизации
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
      ),
    );
  }
}
