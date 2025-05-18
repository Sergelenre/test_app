import 'package:flutter/material.dart';
import 'package:test/feature/presentation/widgets/register_login_widget.dart';
import 'package:test/sharedCustoms/auth_custom_header.dart';
import 'package:test/sharedCustoms/custom_button.dart';
import 'package:test/sharedCustoms/custom_scaffold.dart';
import 'package:test/sharedCustoms/value_listenable_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  final ValueNotifier<bool> isPhoneFilled = ValueNotifier(false);
  final ValueNotifier<bool> isPasswordFilled = ValueNotifier(false);

  bool get isCodeComplete =>
      _controllers.every((controller) => controller.text.length == 1);

  @override
  void initState() {
    super.initState();

    _phoneNumber.addListener(() {
      isPhoneFilled.value = _phoneNumber.text.trim().isNotEmpty;
    });

    _password.addListener(() {
      isPasswordFilled.value = _password.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    _password.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    isPhoneFilled.dispose();
    isPasswordFilled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "",
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthCustomHeader(
                title: "Log in to Coinpay",
                subTitle: "Enter your registered mobile number to log in.",
              ),
              RegisterWidget(
                phoneController: _phoneNumber,
                passwordController: _password,
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder2<bool, bool>(
                first: isPhoneFilled,
                second: isPasswordFilled,
                builder: (context, phoneValid, passwordValid, _) {
                  final isEnabled = phoneValid && passwordValid;

                  return CustomButton(
                    onPressed:
                        isEnabled
                            ? () => Navigator.pushNamed(context, "/home")
                            : null,
                    isEnabled: isEnabled,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    text: 'Sign In',
                    fontSize: 13,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
