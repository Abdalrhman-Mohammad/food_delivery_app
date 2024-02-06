import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_theme.dart';
import 'package:food_delivery_app/views/pages/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: AppTheme.theme,
      
      home: const CustomButtonNavigationBar(),
    );
  }
}
