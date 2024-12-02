import 'dart:developer';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_profile.dart';

class MockdbRepositoryPlayer implements DatabaseRepositoryPlayer {
  final List<PlayerProfile> loginsPlayers = [];

  @override
  Future<void> addPlayer(PlayerProfile player) async {
    await Future.delayed(const Duration(seconds: 1));

    if (loginsPlayers
        .any((existingPlayer) => existingPlayer.userName == player.userName)) {
      log("Der Spieler mit dem Nickname '${player.userName}' existiert bereits.");
    } else {
      loginsPlayers.add(player);
      log("Spieler ${player.userName} wurde hinzugefügt.");
    }
  }

  @override
  Future<void> deletePlayer(String login) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      // Пытаемся найти игрока с таким логином
      PlayerProfile playerToRemove = loginsPlayers.firstWhere(
        (player) => player.userName == login, // Ищем игрока по логину
      );

      // Удаляем игрока, если он найден
      loginsPlayers.remove(playerToRemove);
      log("Spieler $login wurde gelöscht.");
    } catch (e) {
      // Если игрок не найден, выбрасывается исключение, обрабатываем его
      log("Kein Spieler mit dem Nickname '$login' gefunden.");
    }
  }

  @override
  Future<PlayerProfile?> getPlayerByLogin(String login) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      // Пытаемся найти игрока с таким логином
      return loginsPlayers.firstWhere((player) => player.userName == login);
    } catch (e) {
      // Если игрок не найден (выбрасывается исключение), возвращаем null
      return null;
    }
  }
}
