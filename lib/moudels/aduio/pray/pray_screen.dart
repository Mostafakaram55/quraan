import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Prayer extends StatefulWidget {
  @override
  State<Prayer> createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  bool isPlaying=false;

  final AudioPlayer audioPlayer=AudioPlayer();
  Future getAudio()async
  {

    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player=AudioCache(prefix: 'aduio/');
    final url=await player.load('b.mp3');
    audioPlayer.setSourceUrl(url.path);
 }
  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(onPressed: (){
            getAudio();
          }, icon: Icon(
            Icons.play_arrow,
          ))
        ],
      ),
    );
  }
}
