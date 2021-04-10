import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// AnimatedContainerCode
export 'package:flutter_widget_guide/UI/Widgets/AnimatedContainerWidget/ViewCode/animatedContainerCode.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Alignment _alignment = Alignment.center;
  double _animatedHeight = 200.0;
  double _animatedWidth = 400.0;
  double _iconHeight = 180.0;
  double _iconWidth = 180.0;
  Color _animatedColor = Colors.white;
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Animated Container Widget',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24),
          child: Center(
            ///Animated Container to change the background color with
            ///an animation
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: _animatedWidth,
              height: _animatedHeight,
              color: _animatedColor,
              curve: Curves.fastOutSlowIn,
              ///Animated container that changes the alignment of
              ///FlutterLogo with an animation
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                alignment: _alignment,
                ///Animated Container to change the dimentions of the
                ///FlutterLogo with an animation
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  height: _iconHeight,
                  width: _iconWidth,
                  child: FlutterLogo(
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () => setState(() {
          /// Condition to toggle the _isAnimated bool variable
          _animatedWidth == 400.0
              ? _isAnimated = true
              : _isAnimated = false;
          /// Condition to change the alignment of Flutter logo
          _isAnimated
              ? _alignment = Alignment.topCenter
              : _alignment = Alignment.center;
          /// Condition to change the width of the background container
          _isAnimated ? _animatedWidth = 200.0 : _animatedWidth = 400.0;
          /// Condition to change the height of background container
          /// MediaQuery.of(context).size.height - 200 is done to keep
          /// height always above the FAB
          _isAnimated
              ? _animatedHeight = MediaQuery.of(context).size.height - 200
              : _animatedHeight = 200.0;
          /// Condition to change the background color
          _isAnimated
              ? _animatedColor = Colors.lightBlue
              : _animatedColor = Colors.white;
          /// Condition to change the width of FlutterLogo
          _isAnimated ? _iconWidth = 100.0 : _iconWidth = 180.0;
          /// Condition to change the height of FlutterLogo
          _isAnimated ? _iconHeight = 100.0 : _iconHeight = 180.0;
        }),
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
        label: Text(
          'Animate',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}