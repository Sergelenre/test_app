import 'package:flutter/material.dart';
import 'package:test/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color textColor;
  final Color disabledTextColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Icon? icon;
  final double elevation;
  final BorderSide borderSide;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.disabledBackgroundColor = AppColors.defaultBackground,
    this.textColor = Colors.white,
    this.disabledTextColor = Colors.grey,
    this.fontSize = 16,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.icon,
    this.elevation = 2,
    this.borderSide = BorderSide.none,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final currentBackgroundColor =
        isEnabled ? backgroundColor : disabledBackgroundColor;

    final currentTextColor = isEnabled ? textColor : disabledTextColor;

    return ElevatedButton.icon(
      onPressed: isEnabled ? onPressed : null,
      icon: icon ?? const SizedBox.shrink(),
      label: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: currentTextColor,
          fontFamily: 'Poppins',
        ),
      ),
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(elevation),
        backgroundColor: WidgetStateProperty.all(currentBackgroundColor),
        padding: WidgetStateProperty.all(padding),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius, side: borderSide),
        ),
      ),
    );
  }
}
