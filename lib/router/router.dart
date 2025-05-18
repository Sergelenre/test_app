import 'package:flutter/material.dart';
import 'package:test/feature/presentation/screens/home/home_screen.dart';
import 'package:test/feature/presentation/screens/login/auth_screen.dart';
import 'package:test/feature/presentation/screens/login/confirm_phone_screen.dart';
import 'package:test/feature/presentation/screens/login/login_screen.dart';
import 'package:test/feature/presentation/screens/login/register_screen.dart';
import 'package:test/feature/presentation/screens/onboarding/onboarding_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/confirmPhone':
        return MaterialPageRoute(builder: (_) => const ConfirmPhoneScreen());
      case '/createAccount':
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
