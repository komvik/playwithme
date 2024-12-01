import 'package:projekt_481_play_with_me/feature/info_players/models/player_profile.dart';

abstract class DatabaseRepositoryPlayer {
  Future<void> addPlayer(PlayerProfile player);
  Future<void> deletePlayer(String login);
  Future<PlayerProfile?> getPlayerByLogin(String login);
}
