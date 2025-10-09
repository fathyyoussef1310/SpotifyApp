import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Features/AudioProfile/songs.dart';
import 'package:spotifyyapp/Features/MainFeatures/Home/HomeScreen.dart';
import 'AudioPlayer.dart';

class SongsItem extends StatelessWidget {
  final songs song;
  const SongsItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,CupertinoPageRoute(builder:(_)=>SimpleAudioPlayer(path: song.path, title: song.name)));
      },
      child: Padding(
        padding:  REdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorsManager.green),
            color: Theme.of(context).scaffoldBackgroundColor
          ),child: Row(
            children: [
              IconButton(onPressed: (){
              Navigator.pushReplacement(context, SimpleAudioPlayer(path: song.path, title: song.name) as Route<Object?>);
                    }, icon: Icon(Icons.music_note)),
              TextButton(onPressed: (){
                Navigator.push(context,CupertinoPageRoute(builder: (BuildContext context) {
                 return  SimpleAudioPlayer(path: song.path, title: song.name);
                }));
              },child: Text(song.name,style:Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500
              ),)),
              IconButton(onPressed: (){
              Navigator.pushReplacement(context, SimpleAudioPlayer(path: song.path, title: song.name) as Route<Object?>);
                    }, icon: Icon(Icons.play_circle_fill_outlined)),
            ],
          ),

        ),
      ),
    );
  }
}
