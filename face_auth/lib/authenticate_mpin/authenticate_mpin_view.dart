import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_auth/authenticate_face/user_details_view.dart';
import 'package:face_auth/common/utils/custom_text_field.dart';
import 'package:face_auth/constants/theme.dart';
import 'package:face_auth/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthenticateMpinView extends StatefulWidget {
  const AuthenticateMpinView({super.key});

  @override
  State<AuthenticateMpinView> createState() => _AuthenticateMpinViewState();
}

class _AuthenticateMpinViewState extends State<AuthenticateMpinView> {
  final _formFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _mpinController = TextEditingController();
  UserModel? loggingUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 52, 92),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 52, 92),
        title: const Text(
          "M-Pin",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
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
              CustomTextField(
                formFieldKey: _formFieldKey,
                controller: _mpinController,
                hintText: "Enter M-pin",
                validatorText: "Enter M-pin to proceed",
              ),
              const SizedBox(
                height: 10,
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
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
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
                final snapshot = await FirebaseFirestore.instance
                    .collection('users')
                    .get();

                for (var doc in snapshot.docs) {
                  final mPin = doc['mPin'].toString();
                  if (_mpinController.text == mPin) {
                    loggingUser = UserModel.fromMap(doc.data()); // Assuming you have a method to map Firestore data to your model
                    break;
                  }
                }

                if (loggingUser != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserDetailsView(user: loggingUser!),
                    ),
                  );
                } else {
                  Navigator.of(context).pop(); // Close the loading dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid M-pin, please try again'),
                    ),
                  );
                }
              } catch (e) {
                Navigator.of(context).pop(); // Close the loading dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to fetch M-pin: $e'),
                  ),
                );
              }
            }
          },
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
