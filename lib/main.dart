import 'package:flutter/material.dart';
import 'package:test/router/router.dart';
import 'package:test/theme/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: '/',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
    );
  }
}
