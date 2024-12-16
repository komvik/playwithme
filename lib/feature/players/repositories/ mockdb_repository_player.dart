import 'package:projekt_481_play_with_me/feature/players/models/player.dart';

abstract class MockDbRepositoryPlayer {
  Future<void> addPlayer(Player player);
  Future<void> deletePlayer(String email);
  Future<Player?> getPlayerByEmail(String email);
}
