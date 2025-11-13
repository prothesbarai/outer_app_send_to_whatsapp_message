import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  static final String accessPermanentToken = "EAALvlPgeNEIBPyf3ymhHn63xihunLoRbSZA34Slqii4ZBdIZCZAXY8ukZCZBBZA1AHWRVbPhzIGgUCd84DVMWuiq7ZBOdQKugOUSazQcqZA4QihJOhQ4iuCTg2Qa5LhDp7me0BofxSNtAB6a5prQoZCVmjWoMV0STOZCFzdNl5l8FIylYrEjIYB5zL2YoqodtINygZDZD";
  static final String fromPhoneNumberId = "893804690476575";

  static Future<Map<String,dynamic>?> sendText(String receiverPhnNo,String name,String orderDetails,String address) async {
    final url = Uri.parse("https://graph.facebook.com/v22.0/$fromPhoneNumberId/messages");
    /// >>> Template Format (Limitation -> 30-60 Char And Pre-approved)
    /*final data = {
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
    };*/
    /// >>> Simple Format (Limitation -> 400-500 Char And Required for cold messages)
    final data = {
      "messaging_product": "whatsapp",
      "to": receiverPhnNo,
      "type": "text",
      "text": {
        "body": """
                *New Order Received*
                ━━━━━━━━━━━━━━━
                *Order ID:* #ORD-20251113-A4F7
                *Date:* ${DateTime.now()}
                *Customer:* $name
                *Phone:* $receiverPhnNo
                *Delivery Address:* $address
                ━━━━━━━━━━━━━━━
                *Order Details:*
                $orderDetails
          """
      }
    };


    try {
      final response = await http.post(
        url,
        headers: {"Authorization": "Bearer $accessPermanentToken", "Content-Type": "application/json",},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (kDebugMode) {print("$result");}
        return result;
      } else {
        if (kDebugMode) {print("Failed : ${response.statusCode} ${response.body}");}
        return null;
      }
    } catch (e) {
      if (kDebugMode) {print("Error sending message: $e");}
    }
    return null;
  }
}
