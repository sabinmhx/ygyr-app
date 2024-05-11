import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/base/widgets/toast.dart';
import 'package:ygyr/services/image_services.dart';
import 'package:ygyr/ui/blurred_image_page.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _imageFile != null ? _imageDisplay() : _emptyImage(),
      ),
      floatingActionButton: _floatingActionButtons(),
    );
  }

  Widget _emptyImage() => const BaseLabelTextWidget(text: 'No image selected');

  Widget _imageDisplay() {
    return Stack(
      children: [
        Image.file(
          File(_imageFile!.path),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        if (_isUploading)
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
      ],
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
          Visibility(
            visible: _imageFile != null,
            child: FloatingActionButton(
              onPressed: _uploadImage,
              heroTag: "uploadButton",
              child: const Icon(Icons.upload),
            ),
          ),
          FloatingActionButton(
            onPressed: () => _openCamera(ImageSource.camera),
            heroTag: "cameraButton",
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }

  Future<void> _openCamera(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null && mounted) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null && !_isUploading) {
      setState(() {
        _isUploading = true;
      });
      final imageResponseModel =
          await ImageUploadService.uploadImage(File(_imageFile!.path));

      if (imageResponseModel != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlurredImageView(
              imageUploadResponseModel: imageResponseModel,
            ),
          ),
        );
      } else {
        Toast.show(context, 'Failed to upload Image');
        log('Failed to upload image');
      }
      setState(() {
        _isUploading = false;
      });
    }
  }
}
