import 'package:flutter/material.dart';

// Export Screens
import 'UI/exportScreens.dart';

void main() {
  runApp(FlutterWidgetGuide());
}

class FlutterWidgetGuide extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widget Guide',
      home: SplashScreen(),
    );
  }
}