import 'package:projekt_481_play_with_me/config/colors.dart';
//import 'package:projekt_481_play_with_me/config/font_family.dart';
import 'package:projekt_481_play_with_me/config/sizes.dart';

import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/config/snack_bar_theme.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  // cardTheme: const CardTheme(color: playerDarkBlue),
  //________________________________________ TextTheme
  textTheme: const TextTheme(
    //________________________________________DISPLAY S:M:

    displaySmall: TextStyle(
      fontSize: myDisplaySmall,
      color: playerDarkBlue,
      // fontFamily: myFjallaOne.fontFamily,
    ),
    //BtnEnloggen,
    //BtnProfilErstellen
    //BtnProfilSpeichern
    displayMedium: TextStyle(
      fontSize: myDisplayMedium,
      color: btnTextTeal,
      //fontFamily: myPassionOne.fontFamily,
      //  fontFamily: mybebasNeue.fontFamily,
    ),
    //___________________________________________ TITLE S:M:L
    titleSmall: TextStyle(
      fontSize: myDisplayMedium,
      color: playerDarkBlue,
      //  fontFamily: myMontserrat.fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: myDisplayMedium,
      color: playerDarkBlue,
      //   fontFamily: myTeko.fontFamily,
    ),
    //Btn Registrieren
    titleLarge: TextStyle(
      fontSize: myTitleSmall,
      color: headInTheClouds,
      //   fontFamily: myMontserrat.fontFamily,
    ),
    //______________________________________________LABLE L:
    labelLarge: TextStyle(
      fontSize: 16,
      color: headInTheClouds,
      //   fontFamily: myTeko.fontFamily,
    ),
    //________________________________________ Another Theme
  ),
//________________
  snackBarTheme: customSnackBarTheme,
);
