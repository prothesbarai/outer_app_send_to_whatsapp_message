import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WhatsappApi {
  static final String accessPermanentToken =
      dotenv.env['ACCESS_PERMANENT_TOKEN'] ?? "";
  static final String fromPhoneNumberId =
      dotenv.env['FROM_PHONE_NUMBER_ID'] ?? "";

  static Future<Map<String, dynamic>?> sendText(
    // String receiverPhnNo,
    // String name,
    // String orderDetails,
    // String address,
    String receiverPhnNo,
    String customerName,
    String orderId,
    String orderItems,
    String grandTotal,
    String deliveryAddress,
    String paymentMethod,
    String orderStatus,
  ) async {
    final url = Uri.parse(
      "https://graph.facebook.com/v25.0/$fromPhoneNumberId/messages",
    );

    // Helper to format strings to meet WhatsApp template parameter constraints
    // WhatsApp template variables cannot contain newlines, tabs, or consecutive spaces
    // Also, WhatsApp does not allow empty strings for parameters.
    String cleanParam(String text) {
      String cleaned = text.replaceAll(RegExp(r'\s+'), ' ').trim();
      return cleaned.isEmpty ? "-" : cleaned;
    }

    // >>> Send Order Template Message =======================
    // Using the pre-approved template that works for business-initiated conversations.
    final data = {
      "messaging_product": "whatsapp",
      "to": receiverPhnNo,
      "type": "template",
      "template": {
        "name": "order_confirmation_v1",
        "language": {"code": "en"},
        "components": [
          {
            "type": "body",
            "parameters": [
              {
                "type": "text",
                "parameter_name": "customer_name",
                "text": cleanParam(customerName),
              },
              {
                "type": "text",
                "parameter_name": "order_id",
                "text": cleanParam(orderId),
              },
              {
                "type": "text",
                "parameter_name": "order_items",
                "text": cleanParam(orderItems),
              },
              {
                "type": "text",
                "parameter_name": "grand_total",
                "text": cleanParam(grandTotal),
              },
              {
                "type": "text",
                "parameter_name": "delivery_address",
                "text": cleanParam(deliveryAddress),
              },
              {
                "type": "text",
                "parameter_name": "payment_method",
                "text": cleanParam(paymentMethod),
              },
              {
                "type": "text",
                "parameter_name": "order_status",
                "text": cleanParam(orderStatus),
              },
            ],
          },
        ],
      },
    };
    // <<< Send Order Template Message =======================

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $accessPermanentToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (kDebugMode) {
          print("Success : $result");
        }
        return result;
      } else {
        if (kDebugMode) {
          print("Failed : ${response.statusCode} ${response.body}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error sending message: $e");
      }
    }
    return null;
  }
}
