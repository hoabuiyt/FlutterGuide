import 'package:flutter/material.dart';

// FontAwesome Icons
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Platform Alert Dialog
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

// URL LAUNCHER
import 'package:url_launcher/url_launcher.dart';

//** Calling Widgets Screen **//

// SafeAreaWidget
import 'package:flutter_widget_guide/UI/Widgets/SafeAreaWidget/safeAreaWidget.dart';

// ExpandedWidget
import 'package:flutter_widget_guide/UI/Widgets/ExpandedWidget/expandedWidget.dart';

// WrapWidget
import 'package:flutter_widget_guide/UI/Widgets/WrapWidget/wrapWidget.dart';

// AnimatedContainerWidget
import 'package:flutter_widget_guide/UI/Widgets/AnimatedContainerWidget/animatedContainer.dart';

// OpacityWidget
import 'package:flutter_widget_guide/UI/Widgets/OpacityWidget/opacityWidget.dart';

// FutureBuilderWidget
import 'package:flutter_widget_guide/UI/Widgets/FutureBuilderWidget/futureBuilderWidget.dart';

class WidgetHomeScreen extends StatefulWidget {

  @override
  _WidgetHomeScreenState createState() => _WidgetHomeScreenState();

}

class _WidgetHomeScreenState extends State<WidgetHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset('assets/PNG/flutterLogo.png'),
          ),
        ),
        title: Text(
            'Flutter Widget Guide',
            style: GoogleFonts.comfortaa(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[

            Card(
              elevation: 0.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                    },
                    child: Text(
                      'Safe Area',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.comfortaa(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidget()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.code_slash_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeAreaWidgetCode()));
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
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,),
                        onPressed: _launchSafeAreaWidget,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),

            Card(
              elevation: 0.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandedWidget()));
                    },
                    child: Text(
                      'Expanded',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.comfortaa(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandedWidget()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.code_slash_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandedWidgetCode()));
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
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,),
                        onPressed: _launchExpandedWidget,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),

            Card(
              elevation: 0.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WrapWidget()));
                    },
                    child: Text(
                      'Wrap',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.comfortaa(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WrapWidget()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.code_slash_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WrapWidgetCode()));
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
                                  'Wrap Widget',
                                  style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        'Wrap widget aligns the widgets in a horizontal and vertical manner. Generally, we use Rows and Columns to do that but if we have some widgets which are not able to fit in the Row/Column then it will give us Overflow Message ( for eg: Right Overflowed by 570 pixels).',
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
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,),
                        onPressed: _launchWrapWidget,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),

            Card(
              elevation: 0.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedContainerWidget()));
                    },
                    child: Text(
                      'Animated Container',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.comfortaa(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold,),
                    ),
                  )
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedContainerWidget()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.code_slash_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedContainerWidgetCode()));
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
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,),
                        onPressed: _launchAnimatedContainerWidget,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),

            Card(
              elevation: 0.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpacityWidget()));
                    },
                    child: Text(
                      'Opacity',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.comfortaa(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpacityWidget()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.code_slash_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpacityWidgetCode()));
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
                                  'Opacity',
                                  style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        'The Opacity widget that makes its child partially transparent. This class colors its child into an intermediate buffer and then merges the child back into the scene partially transparent. For values of opacity other than 0.0 and 1.0, this class is relatively expensive as it needs coloring the child into an intermediate buffer. For the value 0.0, the child is simply not colored at all. For the value 1.0, the child is colored without an intermediate buffer.',
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
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,),
                        onPressed: _launchOpacityWidget,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),

            Card (
              elevation: 0.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FutureBuilderWidget()));
                    },
                    child: Text(
                      'Future Builder',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.comfortaa(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Ionicons.play_circle_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FutureBuilderWidget()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Ionicons.code_slash_outline, color: Colors.blue,),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FutureBuilderWidgetCode()));
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
                                  'Future Builder',
                                  style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        'FutureBuilder Widget is used to create widgets based on the latest snapshot of interaction with a Future.  It is necessary for Future to be obtained earlier either through a change of state or change in dependencies. FutureBuilder is a Widget that will help you to execute some asynchronous function and based on that function’s result your UI will update.\nFutureBuilder is Stateful by nature i.e it maintains its own state as we do in StatefulWidgets.',
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
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,),
                        onPressed: _launchFutureBuilderWidget,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),

          ],
        ),
      )
    );
  }
}

//** Calling YouTube URL's for Each Widgets **//

_launchSafeAreaWidget() async {
  const url = 'https://www.youtube.com/watch?v=lkF0TQJO0bA';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchExpandedWidget() async {
  const url = 'https://www.youtube.com/watch?v=_rnZaagadyo';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchWrapWidget() async {
  const url = 'https://www.youtube.com/watch?v=z5iw2SeFx2M';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchAnimatedContainerWidget() async {
  const url = 'https://www.youtube.com/watch?v=yI-8QHpGIP4';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchOpacityWidget() async {
  const url = 'https://www.youtube.com/watch?v=9hltevOHQBw';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchFutureBuilderWidget() async {
  const url = 'https://www.youtube.com/watch?v=ek8ZPdWj4Qo';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}