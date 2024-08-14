import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Added missing FirebaseAuth import
import 'package:face_auth/common/utils/custom_number_textfield.dart';
import 'package:face_auth/common/utils/custom_text_field.dart';
import 'package:face_auth/common/views/custom_button.dart';
import 'package:face_auth/common/utils/custom_snackbar.dart';
import 'package:face_auth/common/views/otp_screen.dart';
import 'package:face_auth/constants/theme.dart';
import 'package:face_auth/model/password_model.dart';
import 'package:face_auth/register_face/register_face_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EnterPasswordView extends StatefulWidget {
  EnterPasswordView({Key? key}) : super(key: key);

  @override
  _EnterPasswordViewState createState() => _EnterPasswordViewState();
}

class _EnterPasswordViewState extends State<EnterPasswordView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  String _verificationId = '';
  final _formFieldKey = GlobalKey<FormFieldState>();

  Future<void> _sendOtp(BuildContext context) async {
    final phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty) {
      // Handle empty phone number
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-resolution of the code on Android devices
        await _auth.signInWithCredential(credential);
        // Handle success
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verification ID
        setState(() {
          _verificationId = verificationId;
        });
        // Navigate to OTP verification screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle code auto-retrieval timeout
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 240, 248),
        body: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: const Color.fromARGB(255, 3, 52, 92),
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      'Manthan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Connect',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 3, 52, 92),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            formFieldKey: _formFieldKey,
                            controller: _nameController,
                            hintText: "Name",
                            validatorText: "Enter name to proceed",
                          ),
                          // const SizedBox(height: 15),
                          // TextFormField(
                          //   controller:
                          //       _phoneController, // Added phone controller here
                          //   maxLength: 10,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly
                          //   ],
                          //   decoration: InputDecoration(
                          //     fillColor: Colors.white,
                          //     filled: true,
                          //     hintText: 'Mobile no',
                          //     counterText: '',
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(22),
                          //       borderSide: const BorderSide(
                          //           color: Colors.green, width: 1),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(22),
                          //       borderSide: const BorderSide(
                          //           color: Colors.green, width: 1),
                          //     ),
                          //     border: OutlineInputBorder(
                          //       borderSide: const BorderSide(
                          //           color: Colors.green, width: 1),
                          //       borderRadius: BorderRadius.circular(22),
                          //     ),
                          //     prefixIcon: Icon(
                          //       Icons.phone,
                          //       color: Colors.black,
                          //     ),
                          //     contentPadding: const EdgeInsets.all(15),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // InkWell(
                          //   onTap: () async {
                          //     _sendOtp(context);
                          //   },
                          //   child: Container(
                          //     height: 40,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       color: const Color.fromARGB(255, 3, 52, 92),
                          //       borderRadius: BorderRadius.circular(22),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.grey.withOpacity(0.5),
                          //           spreadRadius: 4,
                          //           blurRadius: 3,
                          //           offset: const Offset(0, 3),
                          //         ),
                          //       ],
                          //     ),
                          //     child: const Center(
                          //       child: Text(
                          //         'Send OTP',
                          //         style: TextStyle(
                          //           fontSize: 15,
                          //           color: Colors.white,
                          //         ),
                          //         textAlign: TextAlign.center,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                          // TextFormField(
                          //   controller: _emailController,
                          //   inputFormatters: <TextInputFormatter>[
                          //     FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          //   ],
                          //   decoration: InputDecoration(
                          //     fillColor: Colors.white,
                          //     filled: true,
                          //     hintText: 'Email',
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(22),
                          //       borderSide: const BorderSide(
                          //           color: Colors.green, width: 1),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(22),
                          //       borderSide: const BorderSide(
                          //           color: Colors.green, width: 1),
                          //     ),
                          //     border: OutlineInputBorder(
                          //       borderSide: const BorderSide(
                          //           color: Colors.green, width: 1),
                          //       borderRadius: BorderRadius.circular(22),
                          //     ),
                          //     contentPadding: const EdgeInsets.all(15),
                          //     prefixIcon:
                          //         const Icon(Icons.email, color: Colors.black),
                          //   ),
                          //   autovalidateMode:
                          //       AutovalidateMode.onUserInteraction,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "This field is required";
                          //     }
                          //     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          //         .hasMatch(value)) {
                          //       return "Please enter a valid email";
                          //     }
                          //     return null;
                          //   },
                          // ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () async {
                              if (_formFieldKey.currentState!.validate()) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegisterFaceView(
                                      name: _nameController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 127, 183, 230),
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
