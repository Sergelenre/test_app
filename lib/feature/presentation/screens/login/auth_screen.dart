import 'package:flutter/material.dart';
import 'package:test/assets/assets.dart';
import 'package:test/sharedCustoms/custom_button.dart';
import 'package:test/sharedCustoms/custom_scaffold.dart';
import 'package:test/sharedCustoms/custom_text.dart';
import 'package:test/theme/app_color.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "",
      body: Column(
        children: [
          Image.asset(Assets.authImg),
          SizedBox(height: 20),
          CustomText(
            text: "Create your\nCoinpay account",
            fontSize: 25,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          CustomText(
            text:
                "Coinpay is a powerful tool that allows you to easily\nsend, receive, and track all your transactions.",
            maxLines: 2,
            fontSize: 13,
          ),
          SizedBox(height: 35),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              text: "Sign Up",
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              backgroundColor: AppColors.background,
              textColor: AppColors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              text: "Log In",
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/confirmPhone');
              },
            ),
          ),
          SizedBox(height: 35),
          CustomText(
            text:
                "By continuing you accept our\nTerms of Service and Privacy Policy",
            maxLines: 3,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
