import 'package:flutter/material.dart';
import 'package:gamificacao/presentation/pages/home/home_page.dart';

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 27, 245)),
        useMaterial3: true,
      ),
      // home: LoginPage(),
        home: const HomePage(),
    );
  }
}