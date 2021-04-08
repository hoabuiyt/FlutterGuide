import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
                'Safe Area Widget - Code',
                style: GoogleFonts.comfortaa(),
            )
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