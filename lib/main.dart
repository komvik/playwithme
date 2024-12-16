import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/config/theme.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/authent_registr_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projekt_481_play_with_me/feature/players/models/player_mockdb.dart';
import 'package:projekt_481_play_with_me/feature/players/models/player_storage.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/%20mockdb_repository_player.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/storage_repository_player.dart';
import 'package:provider/provider.dart';
import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<MockDbRepositoryPlayer>(create: (_) => PlayerMockDB()),
        Provider<StorageRepositoryPlayer>(create: (_) => PlayerStorage()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Willkommen,\nSpiel mit uns",
      theme: myTheme,
      home: const AuthorizationScreen(),
    );
  }
}
