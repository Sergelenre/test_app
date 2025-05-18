import 'package:flutter/material.dart';
import 'package:test/feature/presentation/widgets/register_login_widget.dart';
import 'package:test/sharedCustoms/auth_custom_header.dart';
import 'package:test/sharedCustoms/custom_button.dart';
import 'package:test/sharedCustoms/custom_scaffold.dart';
import 'package:test/sharedCustoms/value_listenable_builder.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
                title: "Create an Account",
                subTitle: "Enter your mobile number to verify your account",
              ),
              RegisterWidget(
                passwordController: _password,
                phoneController: _phoneNumber,
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
                    onPressed: isEnabled ? () => print("Sign Up tapped") : null,
                    isEnabled: isEnabled,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    text: 'Sign Up',
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
