import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Platform Alert Dialog
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

import '../animatedContainer.dart';

void main() {
  runApp(AnimatedContainerWidgetCode());
}

class AnimatedContainerWidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Container Widget - Code',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: Scaffold(
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
            'Animated Container Widget - Code',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.comfortaa(fontSize: 15, color: Colors.black,),
          ),
          actions: [
            IconButton(
              icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedContainerWidget()));
              },
            ),
            IconButton(
              icon: Icon(Ionicons.information_circle_outline, color: Colors.blue,),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return PlatformAlertDialog(
                      title: Text(
                        'Animated Container',
                        style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              'Generally, in Flutter a container is a simple widget with well-defined properties like height, width, and color, etc. Whereas, the AnimatedContainer widget is a simple container widget with animations. These types of widgets can be animated by altering the values of their properties which are the same as the Container widget. These types of animation in Flutter is known as ‘Implicit Animation. We will discuss then in detail in this article by building a simple app with AnimatedContainer widget.',
                              style: GoogleFonts.comfortaa(height: 2),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        PlatformDialogAction(
                          child: Text(
                            'OK',
                            style: GoogleFonts.comfortaa(),
                          ),
                          actionType: ActionType.Preferred,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
        body: DartCodeViewer(r'''

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
          'Wrap Widget',
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

      ''',
        ),
      ),
    );
  }
}