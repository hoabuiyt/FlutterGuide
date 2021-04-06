import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(WrapWidgetCode());
}

class WrapWidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wrap Widget - Code',
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
              'Wrap Widget - Code',
              style: GoogleFonts.comfortaa(),
            )
        ),
        body: DartCodeViewer(r'''

import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

//WrapCode
export 'package:FlutterWidgetGuide/UI/Widgets/WrapWidget/ViewCode/wrapWidgetCode.dart';

class WrapWidget extends StatefulWidget {
  @override
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {

  BuildContext context; //global context

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    children: <Widget>[
                      Text(
                          'Without Wrap widget',
                          style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                        child: Text(
                            'Here we observe that the layout is overflowing to the right\n'
                              'which results in a broken widget',
                            style: GoogleFonts.comfortaa(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey[400],),
                            textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                ///This will create an overflow error
                Row(
                  children: <Widget>[
                    chipDesign('Food', Color(0xFF4fc3f7)),
                    chipDesign('Lifestyle', Color(0xFFffb74d)),
                    chipDesign('Health', Color(0xFFff8a65)),
                    chipDesign('Sports', Color(0xFF9575cd)),
                    chipDesign('Nature', Color(0xFF4db6ac)),
                    chipDesign('Fashion', Color(0xFFf06292)),
                    chipDesign('Heritage', Color(0xFFa1887f)),
                    chipDesign('City Life', Color(0xFF90a4ae)),
                    chipDesign('Entertainment', Color(0xFFba68c8)),
                  ],
                ),
              ],
            ),

            divider(context),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: <Widget>[
                      Text(
                          'With Wrap widget',
                          style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12, top: 8),
                        child: Text(
                          'Here we observe that chips are contained inside a Wrap '
                              'widget.\nIt adjusts all the children according to the space'
                              ' available\nand automatically wraps to the next line',
                          style: GoogleFonts.comfortaa(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey[400],),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                ///This will handle itself to get rid of the overflow error
                Wrap(
                  spacing: 0.0, // gap between adjacent chips
                  runSpacing: 0.0, // gap between lines
                  children: <Widget>[
                    chipDesign('Food', Color(0xFF4fc3f7)),
                    chipDesign('Lifestyle', Color(0xFFffb74d)),
                    chipDesign('Health', Color(0xFFff8a65)),
                    chipDesign('Sports', Color(0xFF9575cd)),
                    chipDesign('Nature', Color(0xFF4db6ac)),
                    chipDesign('Fashion', Color(0xFFf06292)),
                    chipDesign('Heritage', Color(0xFFa1887f)),
                    chipDesign('City Life', Color(0xFF90a4ae)),
                    chipDesign('Entertainment', Color(0xFFba68c8)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


///Common method to design a chip with different properties
///like label and background color
Widget chipDesign(String label, Color color) => Container(
  child: Chip(
    label: Text(
      label,
      style: GoogleFonts.comfortaa(color: Colors.white,)
    ),
    backgroundColor: color,
    elevation: 4,
    shadowColor: Colors.grey[50],
    padding: EdgeInsets.all(4),
  ),
  margin: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
);

///Method to create a divider with added margin
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