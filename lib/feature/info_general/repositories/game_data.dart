import 'package:projekt_481_play_with_me/feature/navigation_wrapper/models/game_item.dart';
import 'package:projekt_481_play_with_me/feature/courts/repositories/court_data.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/player_list_players_formockdb.dart';

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
