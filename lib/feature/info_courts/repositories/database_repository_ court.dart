import '../models/basketball_court.dart';
import '../../authorization/models/player.dart';

abstract class DatabaseRepositoryCourt {
  // Player-related methods
  void addPlayer(Player player);
  Player? getPlayer(String login);
  void updatePlayer(Player player);
  void deletePlayer(String login);

  // BasketballCourt-related methods
  void addCourt(BasketballCourt court);
  BasketballCourt? getCourt(String name);
  void updateCourt(BasketballCourt court);
  void deleteCourt(String name);
}
