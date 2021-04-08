import 'package:flutter/material.dart';

// Dart Code Viewer
import 'package:dart_code_viewer/dart_code_viewer.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FutureBuilderWidgetCode());
}

class FutureBuilderWidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Future Builder Widget - Code',
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
              'Future Builder Widget - Code',
              style: GoogleFonts.comfortaa(),
            )
        ),
        body: DartCodeViewer(r'''

import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Test Model to Fetch API
import 'model/test_model.dart';

// API Request & Response
import 'network/testAPI.dart';

// FutureBuilderCode
export 'package:flutter_widget_guide/UI/Widgets/FutureBuilderWidget/ViewCode/futureBuilderWidgetCode.dart';

class FutureBuilderWidget extends StatefulWidget {
  @override
  _FutureBuilderWidgetState createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  bool _isButtonClicked = false;
  var _buttonIcon = Icons.cloud_download;
  var _buttonText = 'Fetch Data';
  var _buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Future Builder Widget',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
      ),
      body: Center(
        child: FutureBuilder<TestFutureBuilderWidget>(
          ///If future is null then API will not be called as soon as the screen
          ///loads. This can be used to make this Future Builder dependent
          ///on a button click.
          future: _isButtonClicked ? getResponse() : null,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {

              ///when the future is null
              case ConnectionState.none:
                return Text(
                  'Press the button to fetch data',
                  textAlign: TextAlign.center,
                );

              case ConnectionState.active:

              ///when data is being fetched
              case ConnectionState.waiting:
                return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));

              case ConnectionState.done:

                ///task is complete with an error (eg. When you
                ///are offline)
                if (snapshot.hasError)
                  return Text(
                    'Error:snapshot.error',
                    textAlign: TextAlign.center,
                  );

                ///task is complete with some data
                return Text(
                  'Fetched Data:snapshot.data.title',
                  textAlign: TextAlign.center,
                );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: _buttonColor,
        onPressed: () {
          ///Calling method to fetch data from the server
          getResponse();

          ///You need to reset UI by calling setState.
          setState(() {
            _isButtonClicked == false
                ? _isButtonClicked = true
                : _isButtonClicked = false;

            if (!_isButtonClicked) {
              _buttonIcon = Icons.cloud_download;
              _buttonColor = Colors.blue;
              _buttonText = 'Fetch Data';
            } else {
              _buttonIcon = Icons.replay;
              _buttonColor = Colors.deepOrange;
              _buttonText = 'Reset';
            }
          });
        },
        icon: Icon(
          _buttonIcon,
          color: Colors.white,
        ),
        label: Text(
          _buttonText,
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