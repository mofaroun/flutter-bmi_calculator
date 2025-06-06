import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: (TextTheme(bodyMedium: TextStyle(color: Colors.white))),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0A0E21), // Base color for theme
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          titleTextStyle: TextStyle(color: Colors.white) // AppBar color
        ),
      ),
      home: InputPage(),
    );
  }
}

