import 'dart:developer';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';
import 'package:projekt_481_play_with_me/feature/info_players/repositories/player_data.dart';

class MockdbRepositoryPlayer implements DatabaseRepositoryPlayer {
  final List<Player> loginsPlayers = players;

  @override
  Future<void> addPlayer(Player player) async {
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
      Player playerToRemove = loginsPlayers.firstWhere(
        (player) => player.userName == login,
      );

      loginsPlayers.remove(playerToRemove);
      log("Spieler $login wurde gelöscht.");
    } catch (e) {
      log("Kein Spieler mit dem Nickname '$login' gefunden.");
    }
  }

  @override
  Future<Player?> getPlayerByLogin(String login) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      return loginsPlayers.firstWhere((player) => player.userName == login);
    } catch (e) {
      return null;
    }
  }
}
