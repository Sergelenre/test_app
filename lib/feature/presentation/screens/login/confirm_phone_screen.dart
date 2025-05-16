import 'package:flutter/material.dart';
import 'package:test/sharedCustoms/custom_button.dart';
import 'package:test/sharedCustoms/custom_scaffold.dart';
import 'package:test/sharedCustoms/custom_text.dart';
import 'package:test/theme/app_color.dart';

class ConfirmPhoneScreen extends StatefulWidget {
  const ConfirmPhoneScreen({super.key});

  @override
  State<ConfirmPhoneScreen> createState() => _ConfirmPhoneScreenState();
}

class _ConfirmPhoneScreenState extends State<ConfirmPhoneScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  bool get isCodeComplete =>
      _controllers.every((controller) => controller.text.length == 1);

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
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
              CustomText(
                text: "Confirm your phone",
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "We sent 6-digit code to +976 8940-1553",
                fontSize: 13,
                color: AppColors.textGray,
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 30,
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 10),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  _controllers[index].text.isEmpty
                                      ? AppColors.defaultBackground
                                      : AppColors.primary,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  _controllers[index].text.isEmpty
                                      ? AppColors.defaultBackground
                                      : AppColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                          if (value.length == 1 && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          }
                          if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: CustomText(
                  text: "Didn't get code? Resend",
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onPressed:
                    isCodeComplete
                        ? () {
                          Navigator.pushNamed(context, "/login");
                        }
                        : null,
                isEnabled: isCodeComplete,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                text: 'Verify Your Number',
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
