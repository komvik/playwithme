import 'package:projekt_481_play_with_me/feature/navigation_wrapper/models/court_item.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/models/player_item.dart';

class Game {
  final Court court;
  final List<PlayerProfil> team;
  final DateTime gameDate;

  Game({
    required this.court,
    required this.team,
    required this.gameDate,
  });
}
