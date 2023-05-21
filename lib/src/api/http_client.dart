import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const timeoutSec = 5;
const Map<String, String> defaultHeaders = {
  'Content-Type': 'application/json; charset=UTF-8',
  'version': "1.0"
};

Future<http.Response> post(String url,
    [Map body = const {}, Map<String, String> headers = defaultHeaders]) async {
  try {
    final res = await http
        .post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: timeoutSec));
    return res;
  } on TimeoutException catch (e) {
    return http.Response(e.toString(), 504);
  } on Exception catch (e) {
    // log error
    return http.Response(e.toString(), 500);
  }
}
