import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerStorage {
// save to SP
  static Future<void> savePlayers(List<Player> players) async {
    final prefs = await SharedPreferences.getInstance();
    String encodedPlayers = Player.encodePlayers(players);
    await prefs.setString("players", encodedPlayers);
  }

// load from SP
  static Future<List<Player>> loadPlayers() async {
    final prefs = await SharedPreferences.getInstance();
    String? playersJson = prefs.getString("players");
    if (playersJson == null) {
      return [];
    }
    return Player.decodePlayers(playersJson);
  }
}
