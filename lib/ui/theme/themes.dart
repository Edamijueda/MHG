import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';

ThemeData getThemes() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColour,
      primaryVariant: pVariantColour,
      //secondary: secondaryColour,
      //secondaryVariant: sVariantColour,
      surface: surfaceColour,
      background: backgroundColour,
      error: errorColour,
      onPrimary: onPrimaryColour,
      //onSecondary: onSecondaryColour,
      onSurface: onSurfaceColour,
      onBackground: onBackgroundColour,
      onError: onErrorColour,
      //brightness: Brightness.light,
    ),
    fontFamily: 'DMSans',

    /* textTheme: TextTheme(
      //headline1: appNameTextStyle,
      //headline5: appMottoTextStyle,
    ),*/

    /* iconTheme: IconThemeData(
      color: Colors.blue,
      size: 24,
      opacity: 1.0,
    ),*/

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: white,
        textStyle: textButtonTextStyle,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColour,
        onPrimary: onPrimaryColour,
        textStyle: textStyle16Bold,
        fixedSize: sizeW326H50,
        shape: rRectWithCircularBR10,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: white,
      hintStyle: hintTextStyle,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: white,
        ),
        borderRadius: borderRadius10,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: white,
        ),
        borderRadius: borderRadius10,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: primaryColour),
      ),
      //labelColor: primaryColour,
      //indicatorSize:
    ),
    //scaffoldBackgroundColor: Colors.grey,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
    ),
  );
}

//use default TextTheme
TextStyle? bodyText2 = ThemeData.light().textTheme.bodyText2;
