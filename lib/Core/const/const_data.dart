
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConstData {
  static bool isLogin = false;
  static String token = "";
  static const String mapKey = "";

  static Future<void> updateToken() async {
    final response = await http.post(
      Uri.parse('your_api_endpoint_here'),
      headers: {
        "Content-Type": "application/json",
      },
      body: {
        // Add your request body here
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      token = data['access_token'];
      isLogin = true;
      print('Token Updated: $token');
    } else {
      print('Failed to obtain access token: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  static Future<void> startTokenUpdater() async {
    Timer.periodic(Duration(seconds: 20), (Timer timer) {
      updateToken();
    });
  }
}