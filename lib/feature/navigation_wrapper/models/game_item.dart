import 'package:projekt_481_play_with_me/feature/info_courts/models/court_item.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_profile.dart';

class Game {
  final Court court;
  final List<PlayerProfile> team;
  final DateTime gameDate;

  Game({
    required this.court,
    required this.team,
    required this.gameDate,
  });
}
