import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';

abstract class DatabaseRepositoryPlayer {
  // fast vie CRUD metode
  Future<void> addPlayer(Player player);
  Future<void> deletePlayer(String email);
  Future<Player?> getPlayerByEmail(String email);
}
