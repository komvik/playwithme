import 'package:projekt_481_play_with_me/feature/courts/models/court_item.dart';
import 'package:projekt_481_play_with_me/feature/players/models/player.dart';

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
