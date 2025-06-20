import 'package:flutter/material.dart';
import 'quick_math_page.dart';
import 'dart:async';

class QuickMathCountdownPage extends StatefulWidget {
  @override
  _QuickMathCountdownPageState createState() => _QuickMathCountdownPageState();
}

class _QuickMathCountdownPageState extends State<QuickMathCountdownPage> {
  int _countdown = 3;
  String _message = "⚡ 3… Focus up!";

  final List<String> _messages = [
    "⚡ 3… Focus up!",
    "🎯 2… Almost there!",
    "🏁 1… Let’s go!",
  ];

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown == 1) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => QuickMathPage()),
        );
      } else {
        setState(() {
          _countdown--;
          _message = _messages[3 - _countdown];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A5DF5),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Text(
            _message,
            key: ValueKey(_message),
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
