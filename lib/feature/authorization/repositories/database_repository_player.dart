import '../models/player.dart';

abstract class DatabaseRepositoryPlayer {
  // Player-related methods
  void addPlayer(Player player);
  void deletePlayer(String login);
}
