import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  final String accessToken = "EAALvlPgeNEIBP7BOorVzSGAgfU5l4A8ewZCLCppRnK6IG1t3Ee8R8fkwdRJkfm0xZBkZC0oCh9s0IrqCF1uZChZAAKCfHkYtwdTwwZC8tmlbqL7eMeHsD7eGmuXuEu6p66oGaZCdkP73cdXv8L3tOr4JOqycBaIC73lJi6wS5It5ZCtCisc5iEqLedGm3AysMp3aOa533givF4zAY6Q99Bf4Eb62DoIgp6ET4p44L7u55egJIppKPop8Plul5uZBqbQUZBGUPQeOohCcZB61CUZBa4JO9euHNqr7qONJUQZDZD";
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
              { "type": "text", "text": "Prothes" }
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
