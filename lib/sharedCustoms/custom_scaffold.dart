import 'package:flutter/material.dart';
import 'package:test/theme/app_color.dart';

class CustomScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final bool hideAppBar;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.hideAppBar = false,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          widget.hideAppBar
              ? null
              : AppBar(
                backgroundColor: AppColors.background,
                title: Text(widget.title),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: widget.body,
      ),
    );
  }
}
