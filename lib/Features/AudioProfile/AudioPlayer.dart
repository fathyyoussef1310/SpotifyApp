import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String audioUrl;
  final String audioname;

  const AudioPlayerScreen({super.key, required this.audioUrl, required this.audioname});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  Future<void> toggleAudio() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(UrlSource(widget.audioUrl));
    }
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(widget.audioname,style: GoogleFonts.farro(color: ColorsManager.green,fontSize: 30.sp,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(assetsManager.SpotifyLogo,
                color: ColorsManager.green,
                width: double.infinity,
                height: 90.sp,
              ),
            ),
            SizedBox(height: 40.h,),
            Padding(
              padding:  REdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
                    onChanged: (value) async {
                      final newPosition = Duration(seconds: value.toInt());
                      await player.seek(newPosition);
                    },
                    activeColor: ColorsManager.green,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position), style: TextStyle(color: ColorsManager.green)),
                      Text(formatTime(duration), style: TextStyle(color: ColorsManager.green)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: IconButton(
                      iconSize: 64,
                      icon: Icon(isPlaying ? CupertinoIcons.pause : CupertinoIcons.play),
                      onPressed: toggleAudio,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
