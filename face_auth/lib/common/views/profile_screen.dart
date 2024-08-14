import 'dart:convert';

import 'package:face_auth/common/utils/extensions/size_extension.dart';
import 'package:face_auth/constants/theme.dart';
import 'package:face_auth/model/user_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserDetailsView extends StatelessWidget {
  final UserModel user;
  const UserDetailsView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        // backgroundColor: appBarColor,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: size.height * .4,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (user.image != null)
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 42,
                            backgroundColor: primaryWhite,
                            backgroundImage:
                                MemoryImage(base64Decode(user.image!)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "MANTHAN IT SOLUTION",
                                style: TextStyle(
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                "${user.name}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: textColor.withOpacity(0.6),
                                ),
                              ),
                              // Text(
                              //   "Mobile No: ${user. ?? 'N/A'}",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 18,
                              //     color: textColor.withOpacity(0.6),
                              //   ),
                              // ),
                              Text(
                                "(MPIN - 678543)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: textColor.withOpacity(0.6),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    SizedBox(height: 0.025.sh),
                    const SizedBox(height: 8),
                    // Text(
                    //   "You are Successfully Authenticated!",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 18,
                    //     color: textColor.withOpacity(0.6),
                    //   ),
                    // ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text:
                                  'By choosing to login, you agree & accept all the applicable ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Terms & Condition',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Terms & Condition tap
                                },
                            ),
                            const TextSpan(
                              text: ', ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Privacy Policy tap
                                },
                            ),
                            const TextSpan(
                              text: ' and ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Security Tips',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Security Tips tap
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}