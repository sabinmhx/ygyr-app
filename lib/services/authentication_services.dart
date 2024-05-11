import 'dart:convert';
import 'dart:developer';

import 'package:ygyr/base/utils/endpoint.dart';
import 'package:ygyr/base/utils/network_service.dart';

class AuthenticationServices {
  Future<bool> login(String email, String password) async {
    try {
      final response = await NetworkService.post(
        url: Uri.parse('${Endpoint.baseUrl}auth/login'),
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        log('true');
        log('${response.statusCode}');
        return true;
      } else {
        log('${response.statusCode}');
        log('false');
        return false;
      }
    } catch (e) {
      log('Error during login: $e');
      return false;
    }
  }

  Future<bool> register(String name, String email, String password,
      String confirmPassword) async {
    try {
      final response = await NetworkService.post(
        url: Uri.parse('${Endpoint.baseUrl}auth/register'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        log('${response.statusCode}');
        return true;
      } else {
        log('${response.statusCode}');

        return false;
      }
    } catch (e) {
      log('Error during registration: $e');
      return false;
    }
  }
}
