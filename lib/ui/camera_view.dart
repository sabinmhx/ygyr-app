import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/ui/blurred_image_page.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  StateSetter? _setState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _imageFile != null ? _imageDisplay() : _emptyImage(),
      ),
      floatingActionButton: _floatingActionButtons(),
    );
  }

  Widget _emptyImage() => const BaseLabelTextWidget(
        text: 'No image selected',
        color: Colors.white,
      );

  Image _imageDisplay() {
    return Image.file(
      File(_imageFile!.path),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _floatingActionButtons() {
    return Padding(
      padding: UiHelper.getOnlyPadding(left: Spacing.large),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => _openCamera(ImageSource.gallery),
            heroTag: "imageButton",
            child: const Icon(Icons.image),
          ),
          FloatingActionButton(
            onPressed: () => _openCamera(ImageSource.camera),
            heroTag: "cameraButton",
            child: const Icon(Icons.camera),
          ),
          FloatingActionButton(
            onPressed: () => _openCamera(ImageSource.camera),
            heroTag: "videoButton",
            child: const Icon(Icons.video_call),
          ),
        ],
      ),
    );
  }

  Future<void> _openCamera(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null && mounted) {
      if (_setState != null) {
        _setState!(() {
          _imageFile = pickedFile;
        });
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BlurredImageView(imageFile: File(pickedFile.path)),
        ),
      );
    }
  }
}
