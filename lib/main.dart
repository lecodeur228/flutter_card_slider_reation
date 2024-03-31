import 'package:flutter/material.dart';
import 'package:flutter_card_slider_reaction/screens/home_screen.dart';
import 'package:flutter_card_slider_reaction/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARD SLIDER REACTION',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const HomeScreen(),
    );
  }
}
