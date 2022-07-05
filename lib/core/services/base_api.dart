import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/services/api_token.dart';

connect(String endpoint) async {
  var url = Uri.parse('$baseUrl/$endpoint');

  final response = await http.get(
    url,
  );

  log('response status code: ${response.statusCode}');
  return response;
}
