import 'dart:developer';
import 'package:projekt_481_play_with_me/feature/info_courts/repositories/database_repository_court.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';

class BasketballCourt {
  String name;
  String location;
  Map<String, List<Player>> schedule =
      {}; // Key is time, value is a list of players playing at that time.

  BasketballCourt(this.name, this.location);

  // Indicate the place and time where they are going to play
  void indicatePlayTime(Player player, String time) {
    if (!schedule.containsKey(time)) {
      schedule[time] = [];
    }
    schedule[time]?.add(player);
    log("${player.login} will play at $name on $time.");
  }

  // Get information: See who is playing at what time
  void getPlayersAtTime(String time) {
    if (schedule.containsKey(time)) {
      log("\nPlayers playing at $name on $time: ${schedule[time]?.map((p) => p.login).join(', ')}\n");
    } else {
      log("No players scheduled for $time at $name.");
    }
  }

  // Plan future games
  void planFutureGame(Player player, String time) {
    indicatePlayTime(player, time);
    log("${player.login} planned a future game at $name on $time.");
  }

  // Save or update the court in the repository
  void saveCourt(DatabaseRepositoryCourt repository) {
    repository.addCourt(this);
  }

  // Delete the court from the repository
  void deleteCourt(DatabaseRepositoryCourt repository) {
    repository.deleteCourt(name);
    log("Court $name deleted from the repository.");
  }
}
