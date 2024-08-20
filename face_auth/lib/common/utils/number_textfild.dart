import 'package:face_auth/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldn extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final GlobalKey formFieldKey;
  final String validatorText;

  const CustomTextFieldn({
    Key? key,
    required this.formFieldKey,
    required this.controller,
    required this.hintText,
    required this.validatorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 6,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        key: formFieldKey,
        controller: controller,
        cursorColor: primaryBlack.withOpacity(0.8),
        style: const TextStyle(
          color: primaryBlack,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.6,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          counterText: "",
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
          // prefixIcon: const Icon(Icons.person, color: Colors.black),
        ),
        validator: (val) {
          if (val == null || val.trim().isEmpty) {
            return "M-pin cannot be empty";
          }
          if (val.length != 6) {
             return "M-pin should be exactly 6 digits";
          }
           else {
            return null;
          }
        });
  }
}
