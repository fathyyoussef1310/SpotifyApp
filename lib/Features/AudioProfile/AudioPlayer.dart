import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';

class SimpleAudioPlayer extends StatefulWidget {
  SimpleAudioPlayer({super.key,required this.path,required this.title});
  final String path;
  final String title;
  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}

class _SimpleAudioPlayerState extends State<SimpleAudioPlayer> {
  AudioPlayer Player=AudioPlayer();
  bool isPlaying=false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState()
  {
    super.initState();
    Player.onDurationChanged.listen((d)=>setState(() {
      duration=d;
    }));
    Player.onPositionChanged.listen((p)=>setState(() {
      position=p;
    }));
    Player.onPlayerComplete.listen((_)=>setState(() {
      position=Duration.zero;
      isPlaying=false;
    }));
  }
  void toggle() async{
    if(isPlaying){
      await Player.pause();
    }else {
      await Player.play(AssetSource(widget.path.replaceAll('assets/','')));
    }
    setState(() {
      isPlaying=!isPlaying;
    });
  }
  String formattime(Duration d){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes : $seconds';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Now Playing",style:Theme.of(context).textTheme.titleMedium?.copyWith(
          color: ColorsManager.green,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.lyrics,color: ColorsManager.green,)),
        ],
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 335.w,
                  height: 370.h,
                  child: Image.asset(assetsManager.SpotifyLogo),
                ),
              ),
              Text(widget.title,style: Theme.of(context).textTheme.bodyLarge,),
              Text("SingerName is"),
              SizedBox(height: 40.h,),
              Slider(
                min: 0,
                activeColor: ColorsManager.green,
                inactiveColor: ColorsManager.whiteGrey,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.clamp(0, duration.inSeconds).toDouble(), onChanged: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await Player.seek(newPosition);
              },),
              Row(
                children: [
                  Text(formattime(position),style: Theme.of(context).textTheme.bodySmall,),
                  Spacer(),
                  Text(formattime(duration-position),style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
              SizedBox(height: 50.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite,size: 30,color: ColorsManager.green,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,size: 40,color: ColorsManager.green,)),
                  Center(
                    child: IconButton(onPressed: (){
                      toggle();
                    }, icon: isPlaying? Icon(Icons.pause_circle_filled_sharp,color: ColorsManager.green,size: 40):
                    Icon(Icons.play_circle_fill_outlined,color: ColorsManager.green,size: 40,),),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,size: 40,color: ColorsManager.green,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.repeat,size: 40,color: ColorsManager.green,)),
                ],
              ),
              SizedBox(height: 10.h,),
            ],
          )
        ],
      ),
    );
  }
}
