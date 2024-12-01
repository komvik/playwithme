import 'dart:developer';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_profile.dart';

class MockdbRepositoryPlayer implements DatabaseRepositoryPlayer {
  // Список игроков
  final List<PlayerProfile> loginsPlayers = [];

  @override
  Future<void> addPlayer(PlayerProfile player) async {
    await Future.delayed(const Duration(seconds: 1)); // Симуляция задержки

    // Проверяем, существует ли игрок с таким логином
    if (loginsPlayers
        .any((existingPlayer) => existingPlayer.nickName == player.nickName)) {
      log("Der Spieler mit dem Nickname '${player.nickName}' existiert bereits.");
    } else {
      loginsPlayers.add(player);
      log("Spieler ${player.nickName} wurde hinzugefügt.");
    }
  }

  @override
  Future<void> deletePlayer(String login) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      // Пытаемся найти игрока с таким логином
      PlayerProfile playerToRemove = loginsPlayers.firstWhere(
        (player) => player.nickName == login, // Ищем игрока по логину
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
      return loginsPlayers.firstWhere((player) => player.nickName == login);
    } catch (e) {
      // Если игрок не найден (выбрасывается исключение), возвращаем null
      return null;
    }
  }
}
