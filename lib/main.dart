import 'package:flutter/material.dart';
import 'package:sd_ex/profile_screen.dart';


import 'home_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      routes: <String, WidgetBuilder>{
        '/welcome': (BuildContext context) => const WelcomeScreen(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/profile': (BuildContext context) => const ProfileScreen()
      },
    );
  }
}

