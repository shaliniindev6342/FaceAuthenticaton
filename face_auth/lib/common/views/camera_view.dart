import 'dart:io';
import 'dart:typed_data';
import 'package:face_auth/blink/image_compression_service.dart';
import 'package:face_auth/common/utils/extensions/size_extension.dart';
import 'package:face_auth/constants/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:live_photo_detector/m7_livelyness_detection.dart';

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
  Uint8List? _imageBytes; 

  final List<M7LivelynessStepItem> _verificationSteps = [
    M7LivelynessStepItem(
      step: M7LivelynessStep.blink,
      title: "Blink",
      isCompleted: false,
      // thresholdToCheck: 0.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startLivenessDetection();
    });
  }

  Future<void> _startLivenessDetection() async {
    try {
      final String? response =
          await M7LivelynessDetection.instance.detectLivelyness(
        context,
        config: M7DetectionConfig(
          steps: _verificationSteps,
          startWithInfoScreen: false,
          maxSecToDetect: 30,
          allowAfterMaxSec: false,
          captureButtonColor: Colors.red,
        ),
      );

      if (response != null) {
        File capturedImageFile = File(response);
        Uint8List imageBytes = capturedImageFile.readAsBytesSync();

        Uint8List? compressedImage = await compressImage(imageBytes);

        if (compressedImage != null) {
          setState(() {
            _imageBytes = compressedImage;
          });

          widget.onImage(_imageBytes!);

          InputImage inputImage =
              InputImage.fromFilePath(capturedImageFile.path);
          widget.onInputImage(inputImage);
        }
      }
    } catch (e) {
      print("Error during liveness detection: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Captured Image Bytes: $_imageBytes");
    }
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
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
        if (_imageBytes != null)
          CircleAvatar(
            radius: 0.15.sh,
            backgroundColor: const Color(0xffD9D9D9),
            backgroundImage: MemoryImage(
              _imageBytes!,
            ),
          )
        else
          CircleAvatar(
            radius: 100,
            backgroundColor: const Color(0xffD9D9D9),
            child: const Icon(
              Icons.camera_alt,
              size: 60,
              color: Color(0xff2E2E2E),
            ),
          ),
      ],
    );
  }
}
