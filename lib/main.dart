import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: YoutubeView(),
    );
  }
}

class YoutubeView extends StatefulWidget {
  const YoutubeView({super.key});

  @override
  State<YoutubeView> createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: '8fwdHMuvKTc',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("youtube view"),
        ),
        body: (kIsWeb)
            ? SingleChildScrollView(
                child: Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    child: YoutubePlayer(
                      controller: _controller,
                      aspectRatio: 16 / 9,
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(child: Text("hello! on mobile")),
              ));
  }
}
