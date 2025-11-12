import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  final String accessPermanentToken = "EAALvlPgeNEIBPyf3ymhHn63xihunLoRbSZA34Slqii4ZBdIZCZAXY8ukZCZBBZA1AHWRVbPhzIGgUCd84DVMWuiq7ZBOdQKugOUSazQcqZA4QihJOhQ4iuCTg2Qa5LhDp7me0BofxSNtAB6a5prQoZCVmjWoMV0STOZCFzdNl5l8FIylYrEjIYB5zL2YoqodtINygZDZD";
  final String fromPhoneNumberId = "893804690476575";

  Future<void> sendText(String receiverPhnNo,String name,String order,String price) async {
    final url = Uri.parse("https://graph.facebook.com/v22.0/$fromPhoneNumberId/messages");

    /// >>> Template Format (Limitation -> 30-60 Char And Pre-approved)
    final data = {
      "messaging_product": "whatsapp",
      "to": receiverPhnNo,
      "type": "template",
      "template": {
        "name": "first_template",
        "language": { "code": "en_US" },
        "components": [
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": name},
              {"type": "text", "text": receiverPhnNo},
              {"type": "text", "text": order},
              {"type": "text", "text": price},
            ]
          }
        ]
      }
    };

    /// >>> Simple Format (Limitation -> 400-500 Char And Required for cold messages)
    /*final data = {
      "messaging_product": "whatsapp",
      "to": receiverPhnNo,
      "type": "text",
      "text": {
        "body": "এইখানে তোমার 500 character পর্যন্ত message লিখতে পারবে।"
      }
    };*/



    try {
      final response = await http.post(
        url,
        headers: {"Authorization": "Bearer $accessPermanentToken", "Content-Type": "application/json",},
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
