import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double kDefaultPadding = 20;
const Color kWhiteText = Colors.white;

const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(20));
const BorderRadius kSmallBorderRadius = BorderRadius.all(Radius.circular(10));

const String kFontFamily = '.SF Pro Display';
const Color kAccentColor = Color.fromRGBO(255, 125, 51, 1);
const Color kLightBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const Color kLightCardColor = Color.fromRGBO(238, 238, 239, 1);
const Color kPromptTextColor = Color.fromRGBO(35, 34, 34, 1);
const Color kBorderColor = Color(0xFFE0E0E0);

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kLightBackgroundColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        // iconTheme: ,
        // foregroundColor: Color(0xFF232222),
        foregroundColor: kPromptTextColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: kLightBackgroundColor,
        titleTextStyle: TextStyle(
            color: kPromptTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: kFontFamily)),
    colorScheme: ColorScheme.fromSwatch(
        cardColor: kLightCardColor,
        backgroundColor: kLightBackgroundColor,
        brightness: Brightness.light,
        errorColor: const Color.fromRGBO(242, 83, 84, 1),
        accentColor: kAccentColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: kPromptTextColor,
        fontWeight: FontWeight.w600,
        fontFamily: kFontFamily,
        fontSize: 32,
      ),
      headlineLarge: TextStyle(
        color: kPromptTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
      headlineMedium: TextStyle(
        color: kPromptTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      headlineSmall: TextStyle(
        color: kPromptTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        color: kPromptTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      titleMedium: TextStyle(
        color: kPromptTextColor,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        color: kPromptTextColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        color: kPromptTextColor,
        fontSize: 16,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: kPromptTextColor,
        fontSize: 16,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: kPromptTextColor,
        fontSize: 12,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
