import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_auth/common/utils/custom_snackbar.dart';
import 'package:face_auth/common/utils/custom_text_field.dart';
import 'package:face_auth/common/utils/number_textfild.dart';
import 'package:face_auth/constants/theme.dart';
import 'package:face_auth/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class EnterDetailsView extends StatefulWidget {
  final String image;
  final String name;
  final FaceFeatures faceFeatures;
  const EnterDetailsView({
    Key? key,
    required this.image,
    required this.faceFeatures,
    required this.name,
  }) : super(key: key);

  @override
  State<EnterDetailsView> createState() => _EnterDetailsViewState();
}

class _EnterDetailsViewState extends State<EnterDetailsView> {
  bool isRegistering = false;
  final _formFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _mpinController = TextEditingController();
  DateTime date = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 52, 92),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 52, 92),
        // backgroundColor: appBarColor,
        title: const Text(
          "M-Pin",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFieldn(
                formFieldKey: _formFieldKey,
                controller: _mpinController,
                hintText: "Enter M-pin",
                validatorText: "Enter name to proceed",
              ),
              SizedBox(
                height: 10,
              ),
              // CustomButton(
              //   text: "Register Now",
              //   onTap: () async {
              //     if (_formFieldKey.currentState!.validate()) {
              //       FocusScope.of(context).unfocus();

              //       showDialog(
              //         context: context,
              //         barrierDismissible: false,
              //         builder: (context) => const Center(
              //           child: CircularProgressIndicator(
              //             color: accentColor,
              //           ),
              //         ),
              //       );

              //       try {
              //         String userId = Uuid().v1();
              //         UserModel user = UserModel(
              //           id: userId,
              //           name: widget.name,
              //           mPin: int.tryParse(_mpinController.text) ??
              //               0, // Convert to int
              //           image: widget.image,
              //           registeredOn: DateTime.now().day,
              //           faceFeatures: widget.faceFeatures,
              //         );

              //         await FirebaseFirestore.instance
              //             .collection("users")
              //             .add(user.toJson());

              //         CustomSnackBar.successSnackBar("Registration Success!");
              //         Navigator.of(context).popUntil((route) => route.isFirst);
              //       } catch (e) {
              //         log("Registration Error===============================: $e");
              //         CustomSnackBar.errorSnackBar(
              //             "Registration Failed! Try Again.");
              //         Navigator.of(context).pop(); // Pop the loading dialog
              //       }
              //     }
              //   },
              // ),
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
          // onPressed: () {
          onPressed: () async {
            if (_formFieldKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: accentColor,
                  ),
                ),
              );

              try {
                String userId = Uuid().v1();
                UserModel user = UserModel(
                  id: userId,
                  name: widget.name,
                  mPin: int.tryParse(_mpinController.text) ?? 0, 
                  image: widget.image,
                  registeredOn: date.day,
                  faceFeatures: widget.faceFeatures,
                );

                await FirebaseFirestore.instance
                    .collection("users")
                    .add(user.toJson());
                CustomSnackBar.successSnackBar("Registration Success!");
                Navigator.of(context).popUntil((route) => route.isFirst);
              } catch (e) {
                log("Registration Error===============================: $e");
                CustomSnackBar.errorSnackBar("Registration Failed! Try Again.");
                Navigator.of(context).pop(); 
              }
            }
          },
          // },
          child: const Center(
            child: Text(
              'Submit',
              style: TextStyle(color: Color.fromARGB(255, 3, 52, 92)),
            ),
          ),
        ),
      ),
    );
  }
}
