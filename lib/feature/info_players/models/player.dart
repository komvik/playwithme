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
  final String userId;
  final String firstName;
  final String lastName;
  final String nickName;
  final String userName;
  final String eMail;
  final String password;
  final String avatarUrl;
  final List<String> availability;
  final bool sendMessage;
  final bool online;

  Player({
    this.userId = "",
    this.userName = "",
    this.eMail = "",
    this.password = "",
    required this.firstName,
    required this.lastName,
    this.nickName = "Keine",
    this.avatarUrl = "assets/images_avatar/avatar1.png",
    this.availability = const ['Ja', 'Vielleicht', 'Nein'],
    this.sendMessage = false,
    this.online = false,
  });
}
