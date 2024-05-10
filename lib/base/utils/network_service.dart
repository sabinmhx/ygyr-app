import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

///  Make HTTP requests using the http package.
class NetworkService {
  static final HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(
      logLevel: LogLevel.BODY,
    ),
  ]);

  /// Performs a GET request.
  /// - [url]: The URL to send the request to.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        url,
        headers: headers,
      );
      _checkResponse(response);

      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  /// Performs a POST request.
  /// - [url]: The URL to send the request to.
  /// - [body]: Optional body of the request.
  /// - [encoding]: Optional encoding for the request body.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<Response> post(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await http.post(url, headers: headers);
      _checkResponse(response);
      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  /// Performs a PUT request.
  /// - [url]: The URL to send the request to.
  /// - [body]: Optional body of the request.
  /// - [encoding]: Optional encoding for the request body.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<Response> put(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await http.put(url, headers: headers);
      _checkResponse(response);
      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  /// Performs a DELETE request.
  /// - [url]: The URL to send the request to.
  /// - [body]: Optional body of the request.
  /// - [encoding]: Optional encoding for the request body.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<Response> patch(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await http.patch(url, headers: headers);
      _checkResponse(response);
      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  /// Performs a DELETE request.
  /// - [url]: The URL to send the request to.
  /// - [body]: Optional body of the request.
  /// - [encoding]: Optional encoding for the request body.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<Response> delete(Uri url,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(url, headers: headers);
      _checkResponse(response);
      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  /// Performs a DELETE request.
  /// - [url]: The URL to send the request to.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<Response> head(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await http.head(url, headers: headers);
      _checkResponse(response);
      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  /// Performs a DELETE request.
  /// - [url]: The URL to send the request to.
  /// - [headers]: Optional HTTP headers to include in the request.
  static Future<String> read(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await http.read(url, headers: headers);
      _checkResponse(response);
      return response;
    } catch (e) {
      throw _handleException(e);
    }
  }

  static _checkResponse(dynamic response) {
    final statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        return response;
      case 400:
        throw '$statusCode: Bad request. Please check your request syntax and parameters and try again.';
      case 401:
        throw '$statusCode: Unauthorized. Please log in with valid credentials to access this resource.}';
      case 404:
        throw '$statusCode: Not Found. The requested resource could not be found on the server.}';
      case 500:
        throw '$statusCode: Internal Server Error.';
      default:
        throw "$statusCode: Error occured.";
    }
  }

  static Exception _handleException(dynamic e) {
    if (e is SocketException) {
      throw Exception('No Internet Connection');
    } else if (e is ClientException) {
      throw Exception('Error in pkg/http client.');
    } else if (e is TimeoutException) {
      throw Exception('Fetching timed out.');
    } else {
      return Exception('$e');
    }
  }
}
