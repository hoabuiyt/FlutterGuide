import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// ExpandedCode
export 'package:flutter_widget_guide/UI/Widgets/ExpandedWidget/ViewCode/expandedWidgetCode.dart';

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
                        "Description",
                        style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: Image.asset('assets/PNG/flutterLogo.png'),
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