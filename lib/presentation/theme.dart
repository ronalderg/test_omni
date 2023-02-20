import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_omni/gen/fonts.gen.dart';

///gradients
List<Color> splashGradients = [
  const Color.fromRGBO(255, 89, 0, 1),
  const Color.fromRGBO(255, 204, 0, 1)];

///Theme for app
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 5,
        color: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      primaryColor: Colors.blue,
      primarySwatch: Colors.blue,
      fontFamily: FontFamily.intervogue,
    );
  }
}
