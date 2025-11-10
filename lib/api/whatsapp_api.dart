import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  final String accessToken = "YOUR_LONG_LIVED_TOKEN";
  final String phoneNumberId = "YOUR_PHONE_NUMBER_ID";

  Future<void> sendText(String receiverPhnNo, String message) async {
    final url = Uri.parse("https://graph.facebook.com/v20.0/$phoneNumberId/messages");

    final data = {"messaging_product": "whatsapp", "to": "${88}$receiverPhnNo", "type": "text", "text": {"body": message}};

    try {
      final response = await http.post(
        url,
        headers: {"Authorization": "Bearer $accessToken", "Content-Type": "application/json",},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {print("Message sent : ${response.body}");}
      } else {
        if (kDebugMode) {print("Failed : ${response.statusCode} ${response.body}");}
      }
    } catch (e) {
      if (kDebugMode) {print("Error sending message: $e");}
      rethrow;
    }
  }
}
