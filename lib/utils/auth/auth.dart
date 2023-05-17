import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Checks whether a token is available in the secure storage of device,
/// if no token is found, it throws an exception.
Future<String> findTokenOnDevice() async {
  const secureStorage = FlutterSecureStorage();
  final token = await secureStorage.read(key: '${dotenv.env['USER_PROFILE_JWT_KEY']}');
  print('searching token on device');
  print('found = ${token}');
  if (token != null) {
    return token;
  } else {
    throw Exception('Token not found in Secure Storage of this device.');
  }
}

/// Creates a new guest account, and stores associated JWT securely in device.
Future<Map<String, dynamic>> createNewGuestAccount(Map<String, String>? payload) async {
  var requiredFields = ['countryId', 'cityId', 'age'];
  for (var i = 0; i < requiredFields.length; i++) {
    if (payload == null || !payload.containsKey(requiredFields[i])) {
      throw Exception('Required fields missing: ${requiredFields[i]}');
    }
  }

  final response = await http.post(
    Uri.parse('${dotenv.env["BACKEND_URL"]}/auth/v1/guest'),
    body: payload,
  );

  print('createNewGuestAccount Response');
  print(response);

  if (response.statusCode == 200) {
    // Parse the response body as JSON
    final responseBody = json.decode(response.body);

    // Return the parsed JSON as a map
    return Map<String, dynamic>.from(responseBody);
  } else {
    throw Exception('Failed to create guest account');
  }
}