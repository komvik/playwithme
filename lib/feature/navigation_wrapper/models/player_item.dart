class PlayerProfil {
  final String firstName;
  final String lastName;
  final String nicktName;
  final String avatarUrl;

  PlayerProfil({
    required this.firstName,
    required this.lastName,
    this.nicktName = "NO",
    this.avatarUrl = "StandartPath",
  });
}

class PlayerAuth {
  final String username;
  final String password;
  String? authToken; // JSON Web Token

  PlayerAuth({
    required this.username,
    required this.password,
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