import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/sharedCustoms/custom_text.dart';
import 'package:test/theme/app_color.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String description;
  final int currentIndex;
  final int totalPages;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.description,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width - 40,
            ),
            const SizedBox(height: 88),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalPages, (index) {
                bool isSelected = currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isSelected ? 16 : 37,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    color:
                        isSelected
                            ? AppColors.primary
                            : AppColors.defaultBackground,
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),
            CustomText(
              text: description,
              textAlign: TextAlign.center,
              maxLines: 3,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
