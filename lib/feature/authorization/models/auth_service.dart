import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';

class AuthService {
  //___________________________________________________________
  bool authenticate(Player auth) {
    // hier db lesen logic
    if (auth.userName == 'MiJ' && auth.password == '123') {
      return true;
    }
    return false;
  }

  //__________________________________________________________
  void logout(Player auth) {}

  //__________________________________________
  bool isAuthenticated(Player auth) {
    return true;
  }
}
