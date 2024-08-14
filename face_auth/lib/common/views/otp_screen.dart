import 'dart:async';

import 'package:face_auth/register_face/enter_password_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  Timer? _timer;
  int _countDown = 30;
  bool canResend = false;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resendOtp() {
    if (canResend) {
      setState(() {
        _countDown = 30;
        canResend = false;
      });
      startTimer();
    }
  }

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.white, // Text color
    // side: BorderSide(color: Colors.blue, width: 1), // Outline color and width
    padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Padding
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _otpController = TextEditingController();

  Future<void> _verifyOtp() async {
    final otp = _otpController.text.trim();
    if (otp.isEmpty) {
      // Handle empty OTP
      return;
    }

    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      // Show success message
      print(
          "=======================OTP Verified Successfully!===============================");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Verified Successfully!')),
      );

      // Navigate to the WelcomeScreen after a delay
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => EnterPasswordView()),
        );
      });
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error verifying OTP: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 52, 92),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'OTP Verification',
                style: TextStyle(
                    // color: Color.fromARGB(255, 3, 52, 92),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '00:$_countDown',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _otpController,
                maxLength: 6,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allows only digits
                ],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter otp',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Did not recieve otp?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      canResend
                          ? OutlinedButton(
                              style: outlineButtonStyle,
                              onPressed: () {
                                _resendOtp();
                                _verifyOtp();
                              },
                              child: const Text(
                                'Resend',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 3, 52, 92)),
                              ),
                            )
                          : OutlinedButton(
                              style: outlineButtonStyle,
                              onPressed: () {
                                _verifyOtp();
                              },
                              child: const Text(
                                'Resend',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 3, 52, 92)),
                              ),
                            )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 40,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            _verifyOtp();
          },
          child: const Center(
            child: Text(
              'Verify',
              style: TextStyle(color: Color.fromARGB(255, 3, 52, 92)),
            ),
          ),
        ),
      ),
    );
  }
}
