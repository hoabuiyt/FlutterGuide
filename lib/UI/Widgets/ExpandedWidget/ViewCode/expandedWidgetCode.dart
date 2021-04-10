import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Platform Alert Dialog
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

import '../expandedWidget.dart';

void main() {
  runApp(ExpandedWidgetCode());
}

class ExpandedWidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expanded Widget - Code',
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
            'Expanded Widget - Code',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.comfortaa(fontSize: 15, color: Colors.black,),
          ),
          actions: [
            IconButton(
              icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandedWidget()));
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
                        'Expanded Widget',
                        style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              'Expanded widget in flutter comes in handy when we want a child widget or children widgets to take all the available space along the main-axis (for Row the main axis is horizontal & vertical for Column).  Expanded widget can be taken as the child of Row, Column, and Flex. And in case if we don’t want to give equal spaces to our children widgets we can distribute the available space as our will using flex factor. Expanded widget is similar to the Flexible widget in flutter, with its fit property set to FlexFit.tight as default. Expanded widget is basically a shorthand of Flexible widget. But if you are planning to build responsive apps or web apps, then you should definitely switch to Flexible to get more fit options.',
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

const List<String> assetNames = <String>[
  'assets/SVG/expanded_info.svg'
];

class ExpandedWidget extends StatefulWidget {
  @override
  _ExpandedWidgetState createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  ///Flex factor for 1st widget
  int _flexFactor0 = 1;
  ///Flex factor for 2nd widget
  int _flexFactor1 = 2;
  ///Flex factor for 3rd widget
  int _flexFactor2 = 1;

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
          'Expanded Widget',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                contentPadding: EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(top: 28),
                title: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Description',
                        style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: SvgPicture.asset('assets/SVG/expanded_info.svg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  ///First flexible widget
                  Expanded(
                    flex: _flexFactor0,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: GestureDetector(
                        child: Container(
                          child: Center(
                            child: Text(
                              '$_flexFactor0',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF2196f3),
                          width: 48.0,
                          height: 48.0,
                        ),
                        onTap: () => setState(() {
                          _flexFactor0++;
                        }),
                      ),
                    ),
                  ),
                  ///Second flexible widget
                  Expanded(
                    flex: _flexFactor1,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: GestureDetector(
                        child: Container(
                          child: Center(
                            child: Text(
                              '$_flexFactor1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF673ab7),
                          width: 48.0,
                          height: 48.0,
                        ),
                        onTap: () => setState(() {
                          _flexFactor1++;
                        }),
                      ),
                    ),
                  ),
                  ///Third flexible widget
                  Expanded(
                    flex: _flexFactor2,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: GestureDetector(
                        child: Container(
                          child: Center(
                            child: Text(
                              '$_flexFactor2',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.all(10.0),
                          color: const Color(0xFF009688),
                          width: 48.0,
                          height: 48.0,
                        ),
                        onTap: () => setState(() {
                          _flexFactor2++;
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///Click on this button to RESET the values of flex values
            Container(
              margin: EdgeInsets.all(16.0),
              child: OutlinedButton(
                onPressed: () => setState(() {
                  _flexFactor0 = 1;
                  _flexFactor1 = 2;
                  _flexFactor2 = 1;
                }),
                child: Text('RESET'),
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