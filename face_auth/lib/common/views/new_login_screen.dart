import 'package:face_auth/authenticate_face/authenticate_face_view.dart';
import 'package:face_auth/common/utils/custom_snackbar.dart';
import 'package:face_auth/common/utils/screen_size_util.dart';
import 'package:face_auth/register_face/enter_password_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    initializeUtilContexts(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 240, 248),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/natural.png',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/man.png',
                                        width: 50,
                                        height: 50,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.person,
                                            size: 50,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "MANTHAN IT SOLUTION",
                                        style: TextStyle(
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "CRN - ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 109, 108, 108)),
                                          ),
                                          Text(
                                            "XXXX7344",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Text("(Primary)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 109, 108, 108))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            // TextField
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  counterText: "",
                                  hintText: 'Enter 6 digit MPIN',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          'By choosing to login, you agree & accept all the applicable ',
                                      style: TextStyle(color: Colors.black),
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
                                      style: TextStyle(color: Colors.black),
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
                                      style: TextStyle(color: Colors.black),
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EnterPasswordView(),
                                              ),
                                            );
                                          }, //  onTap: () {},
                                          child: SizedBox(
                                            child: Text(
                                              textAlign: TextAlign.start,
                                              "Sign Up",
                                              style: TextStyle(
                                                color: Colors.green,
                                                // decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: const Text(
                          '-- OR --',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // const SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text("Don't have an account?"),
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.of(context).push(
                      //           MaterialPageRoute(
                      //             builder: (context) => EnterPasswordView(),
                      //           ),
                      //         );
                      //       },
                      //       child: const Text(
                      //         "Sign Up",
                      //         style: TextStyle(color: Colors.purple),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 40,
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            // CustomCard('Face Detection', FaceDetectorView()),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthenticateFaceView(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Login using Face ID',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Image.asset(
                                      "assets/face-id.png", // Make sure this path is correct
                                      fit: BoxFit
                                          .cover, // Cover the entire screen
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.of(context).push(
                            //       MaterialPageRoute(
                            //         builder: (context) =>
                            //             const AuthenticateMpinView(),
                            //       ),
                            //     );
                            //   },
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       const Text(
                            //         'Login using M-pin',
                            //         style: TextStyle(
                            //           fontSize: 20,
                            //           color: Colors.black,
                            //           decoration: TextDecoration.underline,
                            //         ),
                            //         textAlign: TextAlign.center,
                            //       ),
                            //       Text(
                            //         'M-pin',
                            //         style: TextStyle(
                            //             color: Colors.blue, fontSize: 15),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initializeUtilContexts(BuildContext context) {
    ScreenSizeUtil.context = context;
    CustomSnackBar.context = context;
  }
}
