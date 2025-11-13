import 'package:flutter/material.dart';
import '../api/whatsapp_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = false;


  void showDialogue(String title, String message){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text("OK"))],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: Stack(
        children: [

          Center(
            child: ElevatedButton(
              onPressed: isLoading ? null : () async {
                try {
                  setState(() {isLoading = true;});
                  final result = await WhatsappApi.sendText("8801718535601", "Prothes Barai","Computer 1pics,Mobile 1 pics","100000");
                  setState(() {isLoading = false;});
                  if(result != null){
                    showDialogue("Successful","Your Message Successfully Send.");
                  }else{
                    showDialogue("Failed","Something went wrong. Please Try again!");
                  }
                } catch (e) {
                  debugPrint("Some Error $e");
                }
              },
              child: Text(isLoading ? "Sending" : "Send WhatsApp Message"),
            ),
          ),
          if(isLoading)
            Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(12),),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 15),
                    Text("Loading...", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
