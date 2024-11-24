import 'dart:developer';

import 'package:projekt_481_play_with_me/feature/authorization/repositories/database_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/player_repository.dart';

import '../models/player.dart';

class MockdbRepositoryPlayer implements DatabaseRepositoryPlayer {
//   @override
//   void addPlayer(Player player) {
//     if (player.login == "player1") {
//       log("exestiert");
//     } else {
//       loginsPlayers.add(player);
//     }
//   }

//   @override
//   void deletePlayer(String login) {
//     if (loginsPlayers.length == login) {
//       int index = 0;
//       loginsPlayers.removeAt(index);
//     }
//   }
// }
  final List<Player> loginsPlayers = [];

  @override
  Future<void> addPlayer(Player player) async {
    await Future.delayed(const Duration(seconds: 1));

    if (player.login == "player1") {
      log("Der Spieler mit dem Login 'player1' existiert bereits.");
    } else {
      loginsPlayers.add(player);
      log("Spieler ${player.login} wurde hinzugefügt.");
    }
  }

  @override
  Future<void> deletePlayer(String login) async {
    await Future.delayed(const Duration(seconds: 1));
    if (loginsPlayers.length == login) {
      int index = 0;
      loginsPlayers.removeAt(index);
      log("Spieler $login wurde gelöscht.");
    } else {
      log("Kein Spieler mit Login '$login' gefunden.");
    }
  }
}
