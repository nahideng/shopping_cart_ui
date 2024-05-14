import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/pages/Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cart Ui Design',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}