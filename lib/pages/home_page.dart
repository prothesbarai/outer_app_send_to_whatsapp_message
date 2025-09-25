import 'package:flutter/material.dart';
import '../api/whatsapp_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final whatsAppApi = WhatsappApi();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await whatsAppApi.sendText("01317818826", "Hello from Flutter App via WhatsApp Cloud API",);
            } catch (e) {
              debugPrint("Some Error $e");
            }
          },
          child: const Text("Send WhatsApp Message"),
        ),
      ),
    );
  }
}
