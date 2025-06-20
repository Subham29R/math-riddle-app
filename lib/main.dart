import 'package:flutter/material.dart';
import 'homepage.dart'; 

void main() => runApp(MathRiddlesApp());

class MathRiddlesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Riddles',
      debugShowCheckedModeBanner: false,
      home: HomePage(), 
    );
  }
}
