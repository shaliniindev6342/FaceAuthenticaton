// import 'package:face_auth/authenticate_face/authenticate_face_view.dart';
// import 'package:face_auth/authenticate_mpin/authenticate_mpin_view.dart';
// import 'package:face_auth/common/utils/custom_snackbar.dart';
// import 'package:face_auth/common/utils/screen_size_util.dart';
// import 'package:face_auth/register_face/enter_password_view.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _mobileController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     initializeUtilContexts(context);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 232, 240, 248),
//         body: Form(
//           key: _formKey,
//           child: Stack(
//             children: [
//               Container(
//                 height: 230,
//                 width: double.infinity,
//                 color: const Color.fromARGB(255, 3, 52, 92),
//                 child: const Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Manthan',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'Connect',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Center(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 5,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const Text(
//                               'Sign In',
//                               style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 3, 52, 92),
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 20),
//                             // TextFormField(
//                             //   controller: _nameController,
//                             //   inputFormatters: <TextInputFormatter>[
//                             //     FilteringTextInputFormatter.deny(RegExp(r'\s')),
//                             //   ],
//                             //   decoration: InputDecoration(
//                             //     fillColor: Colors.white,
//                             //     filled: true,
//                             //     hintText: 'Username',
//                             //     focusedBorder: OutlineInputBorder(
//                             //       borderRadius: BorderRadius.circular(22),
//                             //       borderSide: const BorderSide(
//                             //           color: Colors.green, width: 1),
//                             //     ),
//                             //     enabledBorder: OutlineInputBorder(
//                             //       borderRadius: BorderRadius.circular(22),
//                             //       borderSide: const BorderSide(
//                             //           color: Colors.green, width: 1),
//                             //     ),
//                             //     border: OutlineInputBorder(
//                             //       borderSide: const BorderSide(
//                             //           color: Colors.green, width: 1),
//                             //       borderRadius: BorderRadius.circular(22),
//                             //     ),
//                             //     contentPadding: const EdgeInsets.all(15),
//                             //     prefixIcon: const Icon(Icons.person,
//                             //         color: Colors.black),
//                             //   ),
//                             //   validator: (value) {
//                             //     if (value!.isEmpty) {
//                             //       return 'This field is required';
//                             //     }
//                             //     return null;
//                             //   },
//                             // ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               inputFormatters: <TextInputFormatter>[
//                                 FilteringTextInputFormatter.deny(RegExp(r'\s')),
//                               ],
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 hintText: 'Email',
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(22),
//                                   borderSide: const BorderSide(
//                                       color: Colors.green, width: 1),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(22),
//                                   borderSide: const BorderSide(
//                                       color: Colors.green, width: 1),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Colors.green, width: 1),
//                                   borderRadius: BorderRadius.circular(22),
//                                 ),
//                                 contentPadding: const EdgeInsets.all(15),
//                                 prefixIcon: const Icon(Icons.email,
//                                     color: Colors.black),
//                               ),
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "This field is required";
//                                 }
//                                 if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                                     .hasMatch(value)) {
//                                   return "Please enter a valid email";
//                                 }
//                                 return null;
//                               },
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                             ),
//                             const SizedBox(height: 10),
//                             IntlPhoneField(
//                               controller: _mobileController,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 hintText: 'Mobile no',
//                                 counterText: '',
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(22),
//                                   borderSide: const BorderSide(
//                                       color: Colors.green, width: 1),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(22),
//                                   borderSide: const BorderSide(
//                                       color: Colors.green, width: 1),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Colors.green, width: 1),
//                                   borderRadius: BorderRadius.circular(22),
//                                 ),
//                                 contentPadding: const EdgeInsets.all(15),
//                               ),
//                               initialCountryCode: 'IN',
//                               onChanged: (phone) {
//                                 if (kDebugMode) {
//                                   print(phone.completeNumber);
//                                 }
//                               },
//                               validator: (phone) {
//                                 if (phone == null || phone.number.isEmpty) {
//                                   return 'Please enter a valid phone number';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 20),
//                             InkWell(
//                               onTap: () async {
//                                 // if (!_formKey.currentState!.validate()) {
//                                 //   return;
//                                 // }
//                               },
//                               child: Container(
//                                 height: 40,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 3, 52, 92),
//                                   borderRadius: BorderRadius.circular(22),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 4,
//                                       blurRadius: 3,
//                                       offset: const Offset(0, 3),
//                                     ),
//                                   ],
//                                 ),
//                                 child: const Center(
//                                   child: Text(
//                                     'Login',
//                                     style: TextStyle(
//                                       fontSize: 22,
//                                       color: Colors.white,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text("Don't have an account?"),
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             EnterPasswordView(),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text(
//                                     "Sign Up",
//                                     style: TextStyle(color: Colors.purple),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 // Handle Login using Face ID tap
//                               },
//                               child: Container(
//                                 width: 40,
//                                 padding: const EdgeInsets.all(16.0),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     // CustomCard('Face Detection', FaceDetectorView()),
//                                     GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const AuthenticateFaceView(),
//                                           ),
//                                         );
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             'Login using Face ID',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.black,
//                                               decoration:
//                                                   TextDecoration.underline,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                           SizedBox(
//                                             width: 30,
//                                             child: Image.asset(
//                                               "assets/face-id.png", // Make sure this path is correct
//                                               fit: BoxFit
//                                                   .cover, // Cover the entire screen
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const AuthenticateMpinView(),
//                                           ),
//                                         );
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             'Login using M-pin',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.black,
//                                               decoration:
//                                                   TextDecoration.underline,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                           Text(
//                                             'M-pin',
//                                             style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontSize: 15),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void initializeUtilContexts(BuildContext context) {
//     ScreenSizeUtil.context = context;
//     CustomSnackBar.context = context;
//   }
// }
