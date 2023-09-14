import 'package:flutter/material.dart';

class OnboardingWelcome extends StatelessWidget {
  const OnboardingWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
            image: const NetworkImage(
                'https://images.pexels.com/photos/1172849/pexels-photo-1172849.jpeg'),
            fit: BoxFit.cover),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 500.0, left: 20, right: 5),
        child: Text('Welcome\nto\nHotel App',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
