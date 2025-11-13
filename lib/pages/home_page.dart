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

    final String orderDetails = """
    *Nike Air Max 270*
    Qty: 3 pcs | ৳6,500 × 3 = ৳19,500
                
    *Adidas Ultraboost 22*
    Qty: 2 pcs | ৳8,200 × 2 = ৳16,400
                
   *Apple AirPods Pro (2nd Gen)*
   Qty: 1 pcs | ৳28,000 × 1 = ৳28,000
                
   *Levi’s Slim Fit Jeans*
   Qty: 4 pcs | ৳2,800 × 4 = ৳11,200
                
   *Casio G-Shock Watch*
   Qty: 2 pcs | ৳9,000 × 2 = ৳18,000
                
   ━━━━━━━━━━━━━━━
   *Total:* ৳93,100  
   *Delivery Charge:* ৳100  
   *Grand Total:* ৳93,200  
                
   ━━━━━━━━━━━━━━━
   *Payment Method:* Cash on Delivery  
   *Status:* Pending Confirmation
    """;

    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: Stack(
        children: [

          Center(
            child: ElevatedButton(
              onPressed: isLoading ? null : () async {
                try {
                  setState(() {isLoading = true;});
                  final result = await WhatsappApi.sendText("8801317818826", "Prothes Barai",orderDetails,"House-12, Road-5, Dhanmondi, Dhaka-1209");
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
