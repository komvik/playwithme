import '../models/player.dart';

abstract class DatabaseRepositoryPlayer {
  // Player-related methods
  void addPlayer(Player player);
  Player? getPlayer(String login);
  void updatePlayer(Player player);
  void deletePlayer(String login);
}
