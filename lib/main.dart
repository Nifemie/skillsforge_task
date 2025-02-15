import 'package:flutter/material.dart'; 
import 'package:taskly/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
