import 'package:flutter/material.dart';
import 'package:test/assets/assets.dart';
import 'package:test/feature/presentation/widgets/onboarding_widget.dart';
import 'package:test/sharedCustoms/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pageData = [
    {
      'imagePath': Assets.onboarding1,
      'description': 'Trusted by millions of people, part of one part.',
    },
    {
      'imagePath': Assets.onboarding2,
      'description': 'Spend money abroad, and track your expenses.',
    },
    {
      'imagePath': Assets.onboarding3,
      'description': 'Receive Money From Anywhere In The World',
    },
  ];

  void _onNext() {
    if (_currentIndex < _pageData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemCount: _pageData.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                imagePath: _pageData[index]['imagePath']!,
                description: _pageData[index]['description']!,
                currentIndex: _currentIndex,
                totalPages: _pageData.length,
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: CustomButton(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              onPressed: _onNext,
              text: _currentIndex == _pageData.length - 1 ? 'Start' : 'Next',
            ),
          ),
        ],
      ),
    );
  }
}
