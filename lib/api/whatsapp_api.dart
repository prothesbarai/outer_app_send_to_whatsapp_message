import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  final String accessPermanentToken = "EAALvlPgeNEIBPyf3ymhHn63xihunLoRbSZA34Slqii4ZBdIZCZAXY8ukZCZBBZA1AHWRVbPhzIGgUCd84DVMWuiq7ZBOdQKugOUSazQcqZA4QihJOhQ4iuCTg2Qa5LhDp7me0BofxSNtAB6a5prQoZCVmjWoMV0STOZCFzdNl5l8FIylYrEjIYB5zL2YoqodtINygZDZD";
  final String fromPhoneNumberId = "893804690476575";

  Future<void> sendText(String receiverPhnNo,String name,String order,String price) async {
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
                🛍️ *New Order Received*
                ━━━━━━━━━━━━━━━
                🧾 *Order ID:* #ORD-20251113-A4F7
                📅 *Date:* ${DateTime.now()}
                👤 *Customer:* $name
                📞 *Phone:* $receiverPhnNo
                📍 *Delivery Address:*
                House-12, Road-5, Dhanmondi, Dhaka-1209
                ━━━━━━━━━━━━━━━
                🛒 *Order Details:*
              
                1️⃣ *Nike Air Max 270*
                Qty: 3 pcs | ৳6,500 × 3 = ৳19,500
                
                2️⃣ *Adidas Ultraboost 22*
                Qty: 2 pcs | ৳8,200 × 2 = ৳16,400
                
                3️⃣ *Apple AirPods Pro (2nd Gen)*
                Qty: 1 pcs | ৳28,000 × 1 = ৳28,000
                
                4️⃣ *Levi’s Slim Fit Jeans*
                Qty: 4 pcs | ৳2,800 × 4 = ৳11,200
                
                5️⃣ *Casio G-Shock Watch*
                Qty: 2 pcs | ৳9,000 × 2 = ৳18,000
                
                ━━━━━━━━━━━━━━━
                💰 *Total:* ৳93,100  
                🚚 *Delivery Charge:* ৳100  
                🧾 *Grand Total:* ৳93,200  
                
                ━━━━━━━━━━━━━━━
                💳 *Payment Method:* Cash on Delivery  
                📦 *Status:* Pending Confirmation
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
