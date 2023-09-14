import 'package:flutter/material.dart';

class OnboardingApresentation extends StatelessWidget {
  const OnboardingApresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/1334116/pexels-photo-1334116.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            fit: BoxFit.cover),
      ),
    );
  }
}
