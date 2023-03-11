import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_work/utils/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    highlightColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: MyColors.black,
      ),
      backgroundColor: MyColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: MyColors.white,
      ),
    ),
    dialogBackgroundColor: MyColors.neutral1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.white,
      elevation: 8,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: MyColors.neutral1,
      elevation: 6,
    ),
    hintColor: Colors.grey,
    scaffoldBackgroundColor: MyColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: const Color(0xFFCFD5DE),
    primaryColor: const Color(0xFFFFFFFF),
    //useMaterial3: true,
    cardColor: Colors.black,
    shadowColor: Colors.grey.shade300,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    splashColor: Colors.grey.shade300,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.black.withOpacity(0.3)),
      displayMedium: TextStyle(color: Colors.black.withOpacity(0.4)),
      displaySmall: TextStyle(color: Colors.black.withOpacity(0.5)),
      headlineMedium: TextStyle(color: Colors.black.withOpacity(0.6)),
      headlineSmall: TextStyle(color: Colors.black.withOpacity(0.7)),
      titleLarge: TextStyle(color: Colors.black.withOpacity(0.8)),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    highlightColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: MyColors.white,
      ),
      backgroundColor: MyColors.mainDark,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.mainDark,
      ),
    ),
    dialogBackgroundColor: MyColors.neutral1,
    popupMenuTheme: const PopupMenuThemeData(
      color: MyColors.neutral2,
      elevation: 6,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.black,
      elevation: 8,
    ),
   // useMaterial3: true,
    splashColor: const Color(0xFF191C1F),
    hintColor: Colors.grey,
    cardColor: Colors.white,
    scaffoldBackgroundColor: MyColors.mainDark,
    primaryColor: MyColors.primary,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: const Color(0xFF536872),
    shadowColor: Colors.grey.shade500,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.white.withOpacity(0.3)),
      displayMedium: TextStyle(color: Colors.white.withOpacity(0.4)),
      displaySmall: TextStyle(color: Colors.white.withOpacity(0.5)),
      headlineMedium: TextStyle(color: Colors.white.withOpacity(0.6)),
      headlineSmall: TextStyle(color: Colors.white.withOpacity(0.7)),
      titleLarge: TextStyle(color: Colors.white.withOpacity(0.8)),
    ),
  );
}
