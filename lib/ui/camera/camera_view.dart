import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ygyr/ui/camera/blurred_image_page.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _openCamera() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _imageFile = pickedImage;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BlurredImageView(imageFile: File(pickedImage.path)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _imageFile != null
            ? Image.file(
                File(_imageFile!.path),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              )
            : const Text('No image selected'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                _openCamera();
              },
              child: const Icon(Icons.image),
            ),
            FloatingActionButton(
              onPressed: () {
                _openCamera();
              },
              child: const Icon(Icons.camera),
            ),
            FloatingActionButton(
              onPressed: () {
                _openCamera();
              },
              child: const Icon(Icons.video_call),
            ),
          ],
        ),
      ),
    );
  }
}
