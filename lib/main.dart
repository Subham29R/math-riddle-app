import 'package:flutter/material.dart';
import 'splash_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

void main() => runApp(MathRiddlesApp());

class MathRiddlesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Riddles',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      navigatorObservers: [routeObserver],
    );
  }
}
