import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SimpleAudioPlayer extends StatefulWidget {
  SimpleAudioPlayer({super.key,required this.title,required this.path});
  String title;
  String path;

  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}
class _SimpleAudioPlayerState extends State<SimpleAudioPlayer> {
  @override

  final player=AudioPlayer();
  bool isPlaying= false;

  @override
  void toggleMusic()async{
    if(isPlaying){
      await player.pause();
    }else {
      await player.play(AssetSource(widget.path.replaceAll('assets/', '')));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.title),
            IconButton(icon:isPlaying? Icon(Icons.pause) : Icon(Icons.play_arrow),
              onPressed: toggleMusic,
            ),
          ],
        ),
      ),
    );
  }
}
