import 'package:projekt_481_play_with_me/feature/info_players/models/player_auth.dart';

class AuthService {
  //___________________________________________________________
  bool authenticate(PlayerAuth auth) {
    // hier db lesen logic
    if (auth.username == 'user' && auth.password == '123') {
      auth.authToken = 'user123'; //function generiert token
      return true;
    }
    return false;
  }

  //__________________________________________________________
  void logout(PlayerAuth auth) {
    // logic
    auth.authToken = '';
  }

  //__________________________________________
  bool isAuthenticated(PlayerAuth auth) {
    return auth.authToken != null;
  }
}
