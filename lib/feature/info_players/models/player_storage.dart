import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerStorage {
// save to SP List<Player>
  static Future<void> savePlayers(List<Player> players) async {
    final prefs = await SharedPreferences.getInstance();
    String encodedPlayers = Player.encodePlayers(players);
    await prefs.setString("players", encodedPlayers);
  }

// load from SP List<Player>
  static Future<List<Player>> loadPlayers() async {
    final prefs = await SharedPreferences.getInstance();
    String? playersJson = prefs.getString("players");
    if (playersJson == null) {
      return [];
    }
    return Player.decodePlayers(playersJson);
  }

  //TODO check diese metode mit debug console
  //   trotzdem nicht funktionsfähig obwohl Kai korrigiert hat
  //
  // static Future<Player?> getPlayerByEmail(String email) async {
  //   List<Player?> players = await loadPlayers();
  //   try {
  //     return players.firstWhere((player) => player?.eMail == email,
  //         orElse: () => null);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  static Future<Player?> getPlayerByEmail(String email) async {
    List<Player> players = await loadPlayers();
    try {
      return players.firstWhere((player) => player.eMail == email);
    } catch (e) {
      return null;
    }
  }

  static Future<void> deletePlayerByEmail(String email) async {
    List<Player> players = await loadPlayers();
    players.removeWhere((player) => player.eMail == email);
    await savePlayers(players);
  }
}
