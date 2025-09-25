import 'package:flutter/material.dart';
import 'package:outerappsendsmswhatsapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarThemeData(backgroundColor: Colors.blue,centerTitle: true,iconTheme: IconThemeData(color: Colors.white),foregroundColor: Colors.white)
      ),
      home: const HomePage(),
    );
  }
}
