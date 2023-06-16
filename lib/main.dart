import 'package:expanse_tracker/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorTheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
var kDarkTheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) => {
        runApp(
          MaterialApp(
              darkTheme: ThemeData.dark().copyWith(
                useMaterial3: true,
                colorScheme: kDarkTheme,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkTheme.primaryContainer,
                  ),
                ),
                cardTheme: const CardTheme().copyWith(
                    color: kDarkTheme.secondaryContainer,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16)),
              ),
              theme: ThemeData().copyWith(
                useMaterial3: true,
                colorScheme: kColorTheme,
                textTheme: ThemeData().textTheme.copyWith(
                      titleLarge: TextStyle(
                          color: kColorTheme.onSecondaryContainer,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kColorTheme.primaryContainer,
                  ),
                ),
                cardTheme: const CardTheme().copyWith(
                    color: kColorTheme.secondaryContainer,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16)),
                appBarTheme: const AppBarTheme().copyWith(
                    backgroundColor: kColorTheme.onPrimaryContainer,
                    foregroundColor: kColorTheme.primaryContainer),
              ),
              themeMode: ThemeMode.dark,
              home: const Expenses()),
        )
      });
}
