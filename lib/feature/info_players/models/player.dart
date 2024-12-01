import 'package:projekt_481_play_with_me/feature/authorization/models/auth_service.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_auth.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_profile.dart';

// class PLAYER uses 3 classes

// authorization :
// - username, password, email, authToken
//  profile :
// - firstName , lastName,  nickName ,,avatarUrl,
// - availavility, sendMessage, online
// authservice 3 funktione :
// - authenticate
// - loguut
// - isAuthenticated
class Player {
  final PlayerAuth auth;
  final PlayerProfile profile;

  Player({
    required this.auth,
    required this.profile,
  });

  bool login() {
    return AuthService().authenticate(auth);
  }

  void logout() {
    AuthService().logout(auth);
  }

  bool logged() {
    return AuthService().isAuthenticated(auth);
  }
}
