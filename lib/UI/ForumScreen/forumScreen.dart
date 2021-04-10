import 'package:flutter/material.dart';

// Carousel Slider
import 'package:carousel_slider/carousel_slider.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Ion Icons
import 'package:ionicons/ionicons.dart';

// Url Launcher
import 'package:url_launcher/url_launcher.dart';

// YouTube API
import 'package:youtube_api/youtube_api.dart';

final List<String> imgList = [
  'assets/CommunityCarousel/googleGroups.jpeg',
  'assets/CommunityCarousel/youTube.png',
  'assets/CommunityCarousel/stackOverflowBanner.jpeg',
  'assets/CommunityCarousel/slackBanner.jpeg',
  'assets/CommunityCarousel/mediumBanner.jpeg',
  'assets/CommunityCarousel/twitterBanner.png',
  'assets/CommunityCarousel/discordBanner.jpeg',
];

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  int _current = 0;


  int max = 1;

  String type = "video";

  YoutubeAPI ytApi = new YoutubeAPI(key, maxResults: 1, type: "video");


  static String key = "AIzaSyDeJQ56epke5j3uUB8Q78C59ZcbOVA3ea4";

  //YoutubeAPI ytApi = YoutubeAPI(key);
  List<YT_API> ytResult = [];

  callAPI() async {
    String url = "Top 10 things you need to know about Flutter Engage";
    ytResult = await ytApi.search(url);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    print('API Call - Success');
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(0, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ChatBot Needs to be Implemented
        },
        child: Icon(Ionicons.chatbox, color: Colors.white, size: 25,),
        backgroundColor: Colors.blue,
        tooltip: 'Flutter Assistant',
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Icon(
            Ionicons.chatbubbles,
            color: Colors.blue,
          ),
          title: Text(
            'Forum',
            style: GoogleFonts.comfortaa(
                color: Colors.blue, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Text(
                  'Welcome to the Flutter community',
                  style: GoogleFonts.comfortaa(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Join the conversation',
                style: GoogleFonts.comfortaa(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Text(
                  'Get answers to your questions and stay up to date with everything new and exciting happening in the Flutter community by checking out the links below.',
                  style: GoogleFonts.comfortaa(color: Colors.grey, fontSize: 12, height: 1.5),
                ),
              )
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 25,
            ),
            Wrap(children: <Widget>[
              OutlinedButton.icon(
                  onPressed: _launchGoogleGroupsCommunity,
                  icon: Image.asset(
                    'assets/PNG/googleGroups.png',
                    width: 24,
                  ),
                  label: Text('Google Groups')),
              SizedBox(
                width: 5,
              ),
              OutlinedButton.icon(
                  onPressed: _launchYouTubeCommunity,
                  icon: Image.asset(
                    'assets/PNG/youtube.png',
                    width: 24,
                  ),
                  label: Text('YouTube')),
            ]),
            SizedBox(
              height: 5,
            ),
            Wrap(
              children: <Widget>[
                OutlinedButton.icon(
                    onPressed: _launchStackOverflowCommunity,
                    icon: Image.asset(
                      'assets/PNG/stackOverflow.png',
                      width: 24,
                    ),
                    label: Text('Stack Overflow')),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton.icon(
                    onPressed: _launchSlackCommunity,
                    icon: Image.asset(
                      'assets/PNG/slack.png',
                      width: 24,
                    ),
                    label: Text('Slack')),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton.icon(
                    onPressed: _launchMediumCommunity,
                    icon: Image.asset(
                      'assets/PNG/medium.png',
                      width: 24,
                    ),
                    label: Text('Medium')),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(
              children: <Widget>[
                OutlinedButton.icon(
                    onPressed: _launchTwitterCommunity,
                    icon: Image.asset(
                      'assets/PNG/twitter.png',
                      width: 24,
                    ),
                    label: Text('Twitter')),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton.icon(
                    onPressed: _launchDiscordCommunity,
                    icon: Image.asset(
                      'assets/PNG/discord.png',
                      width: 24,
                    ),
                    label: Text('Discord')),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: OutlinedButton.icon(
                  onPressed: _launchFlutterEvents,
                  icon: Image.asset('assets/PNG/flutterLogo.png'),
                  label: Text(
                    'Flutter Events',
                    style: GoogleFonts.comfortaa(color: Colors.blue,),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Catch the highlights of our Keynote in the recap',
                style: GoogleFonts.comfortaa(color: Colors.grey, fontSize: 13),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                ' then dig in to all the new features in our latest release.',
                style: GoogleFonts.comfortaa(color: Colors.grey, fontSize: 13),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
                child: InkWell(
                  onTap: _launchFlutterEventsVideo,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: ytResult.length,
                    itemBuilder: (_, int index) => listItem(index),
                  ),
                ), //BoxDecoration
              ), //Cotainer
            ), //Center
          ],
        ),
      ),
    );
  }
  Widget listItem(index) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Image.network(
              ytResult[index].thumbnail['default']['url'],
            ),
            Padding(padding: EdgeInsets.only(right: 20.0)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Flutter Engage',
                        softWrap: true,
                        style: GoogleFonts.comfortaa(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Row(
                        children: <Widget>[
                          Text(
                            ytResult[index].channelTitle,
                            softWrap: true,
                            style: GoogleFonts.comfortaa(),
                          ),
                          SizedBox(width: 2.5,),
                          Icon(
                            Icons.verified, color: Colors.blue, size: 13,
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 5.0)),
                      Text(
                        ytResult[index].url,
                        softWrap: true,
                        style: GoogleFonts.comfortaa(fontSize: 10),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}

_launchGoogleGroupsCommunity() async {
  const url =
      'https://www.youtube.com/playlist?list=PLOU2XLYxmsIJ7dsVN4iRuA7BT8XHzGtCr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchYouTubeCommunity() async {
  const url =
      'https://www.youtube.com/playlist?list=PLOU2XLYxmsIJ7dsVN4iRuA7BT8XHzGtCr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchStackOverflowCommunity() async {
  const url = 'https://stackoverflow.com/tags/flutter';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchSlackCommunity() async {
  const url = 'https://fluttercommunity.dev/joinslack';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchMediumCommunity() async {
  const url = 'https://medium.com/flutter';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchTwitterCommunity() async {
  const url = 'https://twitter.com/flutterdev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchDiscordCommunity() async {
  const url = 'https://discord.gg/N7Yshp4';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchFlutterEvents() async {
  const url = 'https://events.flutter.dev/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchFlutterEventsVideo() async {
  const url = 'https://www.youtube.com/watch?v=IdrCyS7EF8M';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
