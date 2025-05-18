import 'package:flutter/material.dart';
import 'package:test/theme/app_color.dart';

class CustomScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final bool hideAppBar;
  final bool isHomeScreen;
  final Color backgroundColor;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.hideAppBar = false,
    this.isHomeScreen = false,
    this.backgroundColor = AppColors.background,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar:
          widget.hideAppBar
              ? null
              : AppBar(
                backgroundColor: AppColors.background,
                title: Text(widget.title),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
      body: Padding(
        padding:
            widget.isHomeScreen == true
                ? const EdgeInsets.symmetric(horizontal: 0.0)
                : const EdgeInsets.symmetric(horizontal: 16.0),
        child: widget.body,
      ),
    );
  }
}
