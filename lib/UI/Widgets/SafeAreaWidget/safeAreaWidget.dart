import 'package:flutter/material.dart';

// SafeAreaCode
export 'package:flutter_widget_guide/UI/Widgets/SafeAreaWidget/ViewCode/safeAreaWidgetCode.dart';

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
                "This widget is below safe area. If you remove the SafeArea "
                    "widget then this text will be behind the notch.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),

            ///Press this button to toggle the value of _isEnabled variable
            ElevatedButton(
              onPressed: () => setState(() {
                _isEnabled == true ? _isEnabled = false : _isEnabled = true;
              }),
              child: Text(_isEnabled ? "Disable SafeArea" : "Enable SafeArea"),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Text(
                "This widget is above safe area",
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