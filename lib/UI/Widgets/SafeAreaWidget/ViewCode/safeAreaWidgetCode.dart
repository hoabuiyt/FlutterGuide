import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Platform Alert Dialog
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

import '../safeAreaWidget.dart';

void main() {
  runApp(SafeAreaWidgetCode());
}

class SafeAreaWidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Area Widget - Code',
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
                'Safe Area Widget - Code',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.comfortaa(fontSize: 15, color: Colors.black,),
            ),
            actions: [
              IconButton(
                icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
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
                          'Safe Area Widget',
                          style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                'SafeArea is an important and useful widget in Flutter which makes UI dynamic and adaptive to a wide variety of devices. While designing the layout of widgets, we consider different types of devices and their pre-occupied constraints of screen like status bar, notches, navigation bar, etc. But new devices are being launched with different designs and in certain scenarios, your app might overlay any of those pre-occupied constraints. So, in order to make our UI adaptive and error-free, we use SafeArea widget.',
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

class SafeAreaWidget extends StatefulWidget {
  @override
  _SafeAreaWidgetState createState() => _SafeAreaWidgetState();
}

class _SafeAreaWidgetState extends State<SafeAreaWidget> {
  ///Bool value to control the behaviour of SafeArea widget.
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: _isEnabled,
        bottom: _isEnabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Text(
                'This widget is below safe area. If you remove the SafeArea widget then this text will be behind the notch.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),

            ///Press this button to toggle the value of _isEnabled variable
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () => setState(() {
                _isEnabled == true ? _isEnabled = false : _isEnabled = true;
              }),
              child: Text(_isEnabled ? 'Disable SafeArea' : 'Enable SafeArea'),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Text(
                'This widget is above safe area',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
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