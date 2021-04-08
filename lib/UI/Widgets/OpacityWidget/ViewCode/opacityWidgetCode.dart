import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(OpacityWidgetCode());
}

class OpacityWidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opacity Widget - Code',
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
              'Opacity Widget - Code',
              style: GoogleFonts.comfortaa(),
            )
        ),
        body: DartCodeViewer(r'''

import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// OpacityCode
export 'package:flutter_widget_guide/UI/Widgets/OpacityWidget/ViewCode/opacityWidgetCode.dart';

class OpacityWidget extends StatefulWidget {
  @override
  _OpacityWidgetState createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {

  ///Initial Slider widget value
  var _value = 0.50;
  ///Initial AnimatedOpacity widget value
  var _animOpacityValue = 1.0;

  var _bgColor = Colors.black87;
  var _textColor = Colors.white;

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
          'Opacity Widget',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    'Without Animation',
                    style: GoogleFonts.comfortaa(color: Colors.black87, fontSize: 18.0, fontWeight: FontWeight.bold,),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Text(
                    'Slide the slider widget to change the value of opacity'
                        'to observe changes on the widget with gradient',
                    style: GoogleFonts.comfortaa(color: Colors.grey[400], fontSize: 14.0, fontStyle: FontStyle.italic,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ///Stack widget to blend FlutterLogo widget with a container
            ///with varying opacity controlled by a Slider Widget
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  child: FlutterLogo(
                    textColor: Colors.white,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: Opacity(
                    opacity: _value,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blueAccent, Colors.white]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ///Slider widget to set opacity value
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Slider(
                value: _value,
                ///Color for active side of Slider
                activeColor: Colors.lightBlue,
                ///Color for inactive side of Slider
                inactiveColor: Colors.lightBlue[50],
                ///Minimum value of the slider
                min: 0.0,
                ///Maximum value of the slider
                max: 1.0,
                ///No.Of divisions from min to max value on the Slider
                divisions: 100,
                ///Value indicator above the slider
                label: '_value.abs()',
                onChanged: (double value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
            const Text('Drag to change opacity'),
            divider(context),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    'With Animation',
                    style: GoogleFonts.comfortaa(color: Colors.black87, fontSize: 18.0, fontWeight: FontWeight.bold,),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Text(
                    'Click on the widget below to observe changes in opacity'
                        'of the text widget with Animation',
                    style: GoogleFonts.comfortaa(color: Colors.grey[400], fontSize: 14.0, fontStyle: FontStyle.italic,),
                    textAlign: TextAlign.center,
                  ),
                ),
                ///Widget to make a Container detect clicks
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: _bgColor),
                    ///Widget to animate the change in opacity
                    child: AnimatedOpacity(
                      opacity: _animOpacityValue,
                      duration: Duration(seconds: 1),
                      child: Text(
                        'Click here to toggle Animation',
                        style: GoogleFonts.comfortaa(color: _textColor, fontSize: 15.0,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () => setState(() {
                    _animOpacityValue == 1.0
                        ? _animOpacityValue = 0.0
                        : _animOpacityValue = 1.0;
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container divider(BuildContext context) => Container(
  child: Divider(),
  margin: EdgeInsets.only(left: 10, right: 10, top: 28, bottom: 28),
);

      ''',
        ),
      ),
    );
  }
}