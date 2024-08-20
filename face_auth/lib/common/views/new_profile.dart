import 'package:face_auth/authenticate_face/authenticate_face_view.dart';
import 'package:face_auth/register_face/enter_password_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:manthan_connect/main.dart';
// import 'package:manthan_connect/view/screens/faceDetection/face_detector_view.dart';

class MpinScreen extends StatefulWidget {
  const MpinScreen({super.key});

  @override
  State<MpinScreen> createState() => _MpinScreenState();
}

class _MpinScreenState extends State<MpinScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // You can handle the image here
      print('Image path: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/natural.png',
              fit: BoxFit.fill,
            ),
          ),
          // First container on top of the background image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width - 30,
                  height: size.height * .4,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/man.png',
                                  width: 50,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.person,
                                      size: 50,
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                                width:
                                    10), // Add some space between image and text
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                const SizedBox(height: 20),
                const Text(
                  '-- OR --',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Second container
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AuthenticateFaceView(),
                      ),
                    );
                  },
                  child: Container(
                    width: size.width - 40,
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        // CustomCard('Face Detection', FaceDetectorView()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const SizedBox(
                                width:
                                    10), // Add some space between text and image
                            Image.asset(
                              'assets/face-id.png',
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 50,
                                );
                              },
                            ),
                            // CustomImage('Face Detection', 'assets/face-id.png',
                            //     FaceDetectorView()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}