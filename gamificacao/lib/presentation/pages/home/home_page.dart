import 'package:flutter/material.dart';
import 'package:gamificacao/features/homepage/prelogin/onboarding_pages/login.dart';
import 'package:gamificacao/features/homepage/prelogin/onboarding_pages/welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const <Widget>[
          OnboardingWelcome(),
          OnboardingLogin(),
        ],
      ),
    );
  }
}
