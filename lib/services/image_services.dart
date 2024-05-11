import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ygyr/base/utils/endpoint.dart';
import 'package:ygyr/model/image_upload_response.dart';

class ImageUploadService {
  static Future<ImageUploadResponseModel?> uploadImage(File imageFile) async {
    final url = Uri.parse('${Endpoint.baseUrl}detect');

    try {
      var request = http.MultipartRequest('POST', url);

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: imageFile.path.split('/').last,
      );

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var decodedData = json.decode(responseData);

        return ImageUploadResponseModel.fromJson(decodedData);
      } else {
        log('Image upload failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }
}
