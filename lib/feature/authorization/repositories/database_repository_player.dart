import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';

abstract class DatabaseRepositoryPlayer {
  Future<void> addPlayer(Player player);
  Future<void> deletePlayer(String login);
  Future<Player?> getPlayerByLogin(String login);
}
