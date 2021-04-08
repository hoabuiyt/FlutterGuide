import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// YouTube Player Flutter
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {

  final String id;

  VideoPlayerScreen({this.id});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Flutter Videos', style: GoogleFonts.comfortaa(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          YoutubePlayer(
            controller: _controller,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
            ],
            showVideoProgressIndicator: true,
            onReady: () {
              print('Playing Video');
            },
          ),
        ],
      )
    );
  }
}