class PlayerProfil {
  final String firstName;
  final String lastName;
  final String nickName;
  final String avatarUrl;
  final List<String> availavility;
  final bool sendMessage;
  final bool online;

  PlayerProfil({
    required this.firstName,
    required this.lastName,
    this.nickName = "Keine",
    this.avatarUrl = "assets/images_avatar/avatar1.png",
    this.availavility = const ['Ja', 'Vielleicht', 'Nein'],
    this.sendMessage = false,
    this.online = false,
  });
}

class PlayerAuth {
  final String username;
  final String password;
  final String email;
  String? authToken; // JSON Web Token

  PlayerAuth({
    required this.username,
    required this.password,
    required this.email,
    this.authToken,
  });
}


//  TODO: implement late for Json
//
//  Map<String, dynamic> toJson() {
//     return {
//       'username': username,
//       'password': password,
//       'authToken': authToken,
//     };
//   }