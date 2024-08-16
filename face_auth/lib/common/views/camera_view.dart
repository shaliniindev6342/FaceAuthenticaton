import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:face_auth/common/utils/extensions/size_extension.dart';
import 'package:face_auth/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_face_api/face_api.dart' as Regula;

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.onImage,
    required this.onInputImage,
  }) : super(key: key);

  final Function(Uint8List image) onImage;
  final Function(InputImage inputImage) onInputImage;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? _image;
  Uint8List? _imageBytes;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _startFaceCapture(); // Automatically start face capture
  }

  Future<void> _startFaceCapture() async {
    try {
      var result = await Regula.FaceSDK.presentFaceCaptureActivity();
      if (result != null) {
        final response =
            Regula.FaceCaptureResponse.fromJson(json.decode(result));
        final base64Image = response?.image?.bitmap?.replaceAll("\n", "") ?? '';
        final imageBytes = base64Decode(base64Image);

        // Log the base64 string and the image size
        print('Captured Face Image Size: ${imageBytes.lengthInBytes} bytes');
        print("Base64 Image: $base64Image");

        setState(() {
          _imageBytes = imageBytes;
        });

        widget.onImage(imageBytes);

        // Save the image to a temporary file and get the path
        final tempDir = await Directory.systemTemp.createTemp();
        final imagePath = '${tempDir.path}/captured_face.png';
        File(imagePath).writeAsBytesSync(imageBytes);

        // Now use the correct path for InputImage
        InputImage inputImage = InputImage.fromFilePath(imagePath);
        widget.onInputImage(inputImage);
      }
    } catch (e) {
      log('Face capture initialization failed: $e');
    }
  }

  Future<void> _getImage() async {
    setState(() {
      _image = null;
    });
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
      maxHeight: 400,
    );
    if (pickedFile != null) {
      _setPickedFile(pickedFile);
    }
  }

  Future<void> _setPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = File(path);
    });

    Uint8List imageBytes = _image!.readAsBytesSync();
    widget.onImage(imageBytes);

    InputImage inputImage = InputImage.fromFilePath(path);
    widget.onInputImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.camera_alt_outlined,
              color: primaryWhite,
              size: 0.038.sh,
            ),
          ],
        ),
        SizedBox(height: 0.025.sh),
        _imageBytes != null
            ? CircleAvatar(
                radius: 0.15.sh,
                backgroundColor: const Color(0xffD9D9D9),
                backgroundImage:
                    MemoryImage(_imageBytes!), // Display the captured image
              )
            : CircleAvatar(
                radius: 0.15.sh,
                backgroundColor: const Color(0xffD9D9D9),
                child: Icon(
                  Icons.camera_alt,
                  size: 0.09.sh,
                  color: const Color(0xff2E2E2E),
                ),
              ),
        // GestureDetector(
        //   onTap: _getImage,
        //   child: Container(
        //     width: 60,
        //     height: 60,
        //     margin: const EdgeInsets.only(top: 44, bottom: 20),
        //     decoration: const BoxDecoration(
        //       gradient: RadialGradient(
        //         stops: [0.4, 0.65, 1],
        //         colors: [
        //           Color(0xffD9D9D9),
        //           primaryWhite,
        //           Color(0xffD9D9D9),
        //         ],
        //       ),
        //       shape: BoxShape.circle,
        //     ),
        //   ),
        // ),
        // Text(
        //   "Click here to Capture",
        //   style: TextStyle(
        //     fontSize: 14,
        //     color: primaryWhite.withOpacity(0.6),
        //   ),
        // ),
      ],
    );
  }
}