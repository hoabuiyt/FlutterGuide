import 'package:flutter/material.dart';

// Gesture Detector
import 'package:flutter/gestures.dart';

// BottomNavyBar
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Export Screens
import 'package:flutter_widget_guide/UI/exportScreens.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          dragStartBehavior: DragStartBehavior.down,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            WidgetHomeScreen(),
            VideoScreen(),
            ForumScreen(),
            AboutScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 500),
        // itemCornerRadius: 15,
        showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(' Widgets', style: GoogleFonts.comfortaa()),
            icon: Icon(Ionicons.folder_open),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            title: Text(' Videos', style: GoogleFonts.comfortaa()),
            icon: Icon(Icons.video_collection),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            title: Text(' Forum', style: GoogleFonts.comfortaa()),
            icon: Icon(Ionicons.chatbubbles),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            title: Text(' About', style: GoogleFonts.comfortaa()),
            icon: Icon(Icons.info),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}