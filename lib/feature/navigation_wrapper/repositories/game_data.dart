import 'package:projekt_481_play_with_me/feature/navigation_wrapper/models/game_item.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/repositories/court_data.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/repositories/player_data.dart';

List<Game> games = [
  Game(
    court: courts[0],
    team: [
      players[0],
      players[3],
    ],
    gameDate: DateTime.parse("2024-11-15 19:30:00"),
  ),
  Game(
    court: courts[0],
    team: [
      players[0],
      players[3],
    ],
    gameDate: DateTime.parse("2024-11-15 19:30:00"),
  ),
];
