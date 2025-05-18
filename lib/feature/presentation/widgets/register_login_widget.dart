import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/sharedCustoms/custom_text.dart';
import 'package:test/sharedCustoms/custom_textField.dart';
import 'package:test/theme/app_color.dart';

class Country {
  final String name;
  final String code;
  final String dialCode;

  Country({required this.name, required this.code, required this.dialCode});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      dialCode: json['dial_code'],
    );
  }
}

class RegisterWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  const RegisterWidget({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final ValueNotifier<List<Country>> countries = ValueNotifier([]);
  final ValueNotifier<Country?> selectedCountry = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    final String response = await rootBundle.loadString(
      'lib/feature/data/test_country.json',
    );
    final List<dynamic> data = json.decode(response);
    final List<Country> loadedCountries =
        data.map((json) => Country.fromJson(json)).toList();

    countries.value = loadedCountries;
    selectedCountry.value =
        loadedCountries.isNotEmpty ? loadedCountries.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Phone Number", textAlign: TextAlign.start),
        SizedBox(height: 8),
        Row(
          children: [
            ValueListenableBuilder<List<Country>>(
              valueListenable: countries,
              builder: (context, countryList, _) {
                return ValueListenableBuilder<Country?>(
                  valueListenable: selectedCountry,
                  builder: (context, selected, _) {
                    return DropdownButtonHideUnderline(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.defaultBackground,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<Country>(
                          value: selected,
                          items:
                              countryList.map((country) {
                                return DropdownMenuItem(
                                  value: country,
                                  child: Text(country.dialCode),
                                );
                              }).toList(),
                          onChanged: (Country? newCountry) {
                            selectedCountry.value = newCountry;
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextfield(
                controller: widget.phoneController,
                keyboardType: TextInputType.phone,
                hintTextColor: AppColors.defaultBackground,
                hintText: 'Mobile Number',
                isPassword: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        CustomText(text: "Password"),
        SizedBox(height: 8),
        CustomTextfield(
          prefixIcon: Icons.lock_outline_rounded,
          hintTextColor: AppColors.defaultBackground,
          controller: widget.passwordController,
          hintText: 'Enter your password',
          isPassword: true,
        ),
      ],
    );
  }

  @override
  void dispose() {
    countries.dispose();
    selectedCountry.dispose();
    super.dispose();
  }
}
