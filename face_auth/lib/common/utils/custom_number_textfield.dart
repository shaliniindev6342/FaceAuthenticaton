import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextFieldnumber extends StatelessWidget {
  final TextEditingController controllers;
  final String hintTexts;
  final GlobalKey formFieldKeys;
  final String validatorTexts;

  const CustomTextFieldnumber({
    Key? key,
    required this.formFieldKeys,
    required this.controllers,
    required this.hintTexts,
    required this.validatorTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Mobile no',
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(22),
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        if (kDebugMode) {
          print(phone.completeNumber);
        }
      },
      validator: (val) {
          if (val == null) {
            return "Number cannot be empty";
          } else {
            return null;
          }
        }
    );
  }
}
