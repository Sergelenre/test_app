import 'package:flutter/material.dart';
import 'package:test/sharedCustoms/custom_text.dart';
import 'package:test/theme/app_color.dart';

class AuthCustomHeader extends StatefulWidget {
  final String title;
  final String subTitle;

  const AuthCustomHeader({this.title = "", this.subTitle = "", super.key});

  @override
  State<AuthCustomHeader> createState() => _AuthCustomHeaderState();
}

class _AuthCustomHeaderState extends State<AuthCustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.title,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: widget.subTitle,
          fontSize: 13,
          color: AppColors.textGray,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
