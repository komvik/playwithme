import 'dart:developer';

import 'package:projekt_481_play_with_me/feature/players/models/player.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/%20mockdb_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/player_data.dart';

class PlayerMockDB implements MockDbRepositoryPlayer {
  final List<Player> loginsPlayers = players;

  @override
  Future<void> addPlayer(Player player) async {
    await Future.delayed(const Duration(seconds: 1));

    if (loginsPlayers
        .any((existingPlayer) => existingPlayer.eMail == player.eMail)) {
      log("Der Spieler mit e-mail  '${player.eMail}' existiert bereits.");
    } else {
      loginsPlayers.add(player);
      log("Spieler ${player.eMail} wurde hinzugefügt.");
    }
  }

  @override
  Future<void> deletePlayer(String email) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      Player playerToRemove = loginsPlayers.firstWhere(
        (player) => player.eMail == email,
      );

      loginsPlayers.remove(playerToRemove);
      log("Spieler $email wurde gelöscht.");
    } catch (e) {
      log("Kein Spieler mit dem e-mail '$email' gefunden.");
    }
  }

  @override
  Future<Player?> getPlayerByEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    Player player;
    try {
      player = loginsPlayers.firstWhere((player) => player.eMail == email);
      return player;
    } catch (e) {
      log(" Error:  $e");
      return null;
    }
  }
}
