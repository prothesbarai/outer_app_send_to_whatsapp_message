import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  final String accessToken = "EAALvlPgeNEIBPyf3ymhHn63xihunLoRbSZA34Slqii4ZBdIZCZAXY8ukZCZBBZA1AHWRVbPhzIGgUCd84DVMWuiq7ZBOdQKugOUSazQcqZA4QihJOhQ4iuCTg2Qa5LhDp7me0BofxSNtAB6a5prQoZCVmjWoMV0STOZCFzdNl5l8FIylYrEjIYB5zL2YoqodtINygZDZD";
  final String phoneNumberId = "893804690476575";

  Future<void> sendText(String receiverPhnNo, String message) async {
    final url = Uri.parse("https://graph.facebook.com/v20.0/$phoneNumberId/messages");

    final data = {
      "messaging_product": "whatsapp",
      "to": "+88$receiverPhnNo",
      "type": "template",
      "template": {
        "name": "first_template",
        "language": { "code": "en_US" },
        "components": [
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": "Prothes"},
              {"type": "text", "text": message},
            ]
          }
        ]
      }
    };


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
