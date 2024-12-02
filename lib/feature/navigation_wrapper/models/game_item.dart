import 'package:projekt_481_play_with_me/feature/info_courts/models/court_item.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';

class Game {
  final Court court;
  final List<Player> team;
  final DateTime gameDate;

  Game({
    required this.court,
    required this.team,
    required this.gameDate,
  });
}
