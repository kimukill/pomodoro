import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

//Color(0xFF232B55), 검은색
//Color(0xFFF4EDDB), 베이지
//Color(0xFFE7626C), 핑크