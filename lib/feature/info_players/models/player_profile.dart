class PlayerProfile {
  final String firstName;
  final String lastName;
  final String nickName;
  final String avatarUrl;
  final List<String> availability;
  final bool sendMessage;
  final bool online;

  PlayerProfile({
    required this.firstName,
    required this.lastName,
    this.nickName = "Keine",
    this.avatarUrl = "assets/images_avatar/avatar1.png",
    this.availability = const ['Ja', 'Vielleicht', 'Nein'],
    this.sendMessage = false,
    this.online = false,
  });
}
