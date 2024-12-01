//authorization
class PlayerAuth {
  final String username;
  final String password;
  final String email;
  String? authToken;

  PlayerAuth({
    required this.username,
    required this.password,
    required this.email,
    this.authToken,
  });
}
