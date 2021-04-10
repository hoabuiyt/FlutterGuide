import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

// Export Commons
import 'package:flutter_widget_guide/Common/exportCommons.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> topCircelAnimation;
  Animation<double> bottomCircelAnimation;
  Animation<double> logoAnimation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    topCircelAnimation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {
          print(topCircelAnimation.value);
        });
      });

    bottomCircelAnimation =
    Tween<double>(begin: 0, end: 350).animate(controller)
      ..addListener(() {
        setState(() {
          print(bottomCircelAnimation.value);
        });
      });

    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          print(logoAnimation.value);
        });
      });
    controller.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (BuildContext context) => new BottomNavigationBarWidget(),
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -50,
            right: -100,
            child: Container(
              height: topCircelAnimation.value,
              width: topCircelAnimation.value,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -150,
            child: Container(
              height: bottomCircelAnimation.value,
              width: bottomCircelAnimation.value,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: logoAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/PNG/appIcon.png',
                    height: 200,
                    width: 200,
                    //color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Flutter Guide',
                    style: GoogleFonts.comfortaa(fontSize: 40, fontWeight: FontWeight.w600, letterSpacing: 2.0,)
                  ),
                  Text(
                    'Learn Flutter from this Space',
                    style: GoogleFonts.comfortaa(letterSpacing: 2.0,)
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}