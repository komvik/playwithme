import 'package:projekt_481_play_with_me/config/colors.dart';
import 'package:projekt_481_play_with_me/config/sizes.dart';

import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  //________________________________________ Text
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: myDisplaySize,
      color: playerDarkBlue,
    ),

    //________________________________________
  ),
);
