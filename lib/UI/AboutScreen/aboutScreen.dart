import 'dart:io' show Platform;

import 'package:flutter/material.dart';

// Flutter Foundation
import 'package:flutter/foundation.dart';

// Flutter Services
import 'package:flutter/services.dart';

// Get APP Version Info
import 'package:get_version/get_version.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Url Launcher
import 'package:url_launcher/url_launcher.dart';

/// main is entry point of Flutter application
void main() {
  // Desktop platforms aren't a valid platform.
  if (!kIsWeb) _setTargetPlatformForDesktop();
  return runApp(AboutScreen());
}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => new _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _platformVersion = 'Unknown';
  String _projectVersion = '';
  String _projectAppID = '';
  String _projectName = '';

  @override
  void initState() {
    _initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void _initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }

    String projectName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _projectVersion = projectVersion;
      _projectAppID = projectAppID;
      _projectName = projectName;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.info,
            color: Colors.blue,
          ),
          title: Text(
            'About',
            style: GoogleFonts.comfortaa(
                color: Colors.blue, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 25, 30, 30),
                alignment: Alignment.centerLeft,
                child: new ListBody(
                  children: <Widget>[
                    new Container(
                      height: 10.0,
                    ),
                    new ListTile(
                      leading: const Icon(Icons.apps),
                      title: const Text('App Name'),
                      subtitle: new Text(_projectName),
                    ),
                    const Divider(height: 20.0),
                    new ListTile(
                      leading: const Icon(Icons.dashboard),
                      title: const Text('App ID'),
                      subtitle: new Text(_projectAppID),
                    ),
                    const Divider(height: 20.0),
                    new ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('App Version'),
                      subtitle: new Text(_projectVersion),
                    ),
                    const Divider(height: 20.0),
                    new ListTile(
                      leading: const Icon(Icons.android_rounded),
                      title: const Text('Running on'),
                      subtitle: new Text(_platformVersion),
                    ),
                    const Divider(height: 20.0),
                    new ListTile(
                      leading: const Icon(Ionicons.logo_google_playstore),
                      title: const Text('Do you like this App'),
                      subtitle: const Text('Rate Our App on Google Play'),
                      onTap: _launchPlaystoreURL,
                    ),
                    const Divider(height: 20.0),
                    new ListTile(
                      leading: const Icon(Ionicons.shield_checkmark_outline),
                      title: const Text('Privacy Policy'),
                      onTap: _launchPrivacyURL,
                    ),
                    const Divider(height: 20.0),
                    new ListTile(
                      leading: const Icon(Ionicons.shield_half_outline),
                      title: const Text('Terms & Conditions'),
                      onTap: _launchTermsURL,
                    ),
                    const Divider(height: 20.0),
                  ],
                ),
              ),
              //SizedBox(height: 30,),
            ],
          ),
        ),
      )
    );
  }
}

_launchPrivacyURL() async {
  const url = '';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchTermsURL() async {
  const url = '';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchPlaystoreURL() async {
  const url = '';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
