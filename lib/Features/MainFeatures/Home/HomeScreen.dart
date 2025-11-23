import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Confiq/ThemeManager.dart';
import 'package:spotifyyapp/Controllers/ThemeController.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';
import 'package:spotifyyapp/Logic/BloC/Logictracks.dart';
import 'package:spotifyyapp/data/user_repo.dart';
import '../../../Core/ColorsManager.dart';
import 'package:spotifyyapp/Features/AudioProfile/AudioPlayer.dart';
import 'Catagories/CatagoriesModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int cIndex = 0;

class _HomescreenState extends State<Homescreen> {
  late final UserRepo repo = UserRepo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          title: Image.asset(
            assetsManager.SpotifyLogo,
            color: ColorsManager.green,
            height: 40.h,
            width: 108.w,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.find<ThemeController>().toggleData(false);
                },
                icon: Icon(CupertinoIcons.light_max)),
            IconButton(
                onPressed: () {
                  Get.find<ThemeController>().toggleData(true);
                },
                icon: Icon(CupertinoIcons.moon_fill)),
          ],
        ),
        body: BlocProvider(
          create: (context) => TracksCubit(repo)..fetchData(),
          child: BlocBuilder<TracksCubit, TracksState>(
            builder: (context, state) {
              if (state is TrackError) {
                return Center(
                  child: Text("Error in Fetching Data"),
                );
              } else if (state is TrackLoading) {
                return Center(
                  child: CircularProgressIndicator(color: ColorsManager.green),
                );
              } else if(state is TrackLoaded)
              {
                final suraList = state.data.data ?? [];
                return ListView.separated(
                    itemCount: suraList.length,
                    separatorBuilder: (context,index)=>SizedBox(height: 8.sp,),
                    itemBuilder:(context,index){
                      final sura = suraList[index];
                      return ListTile(
                        title: Text(sura.name??" ",style: GoogleFonts.inter(color: ColorsManager.green,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                        subtitle: Text(sura.englishName ?? "",style: GoogleFonts.inter(color: ColorsManager.green,fontWeight: FontWeight.bold,fontSize: 20.sp)),
                        trailing:Text("${sura.numberOfAyahs}",style: GoogleFonts.inter(color: ColorsManager.green,fontSize: 20.sp),),
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder:(_)=>AudioPlayerScreen(audioUrl: sura.audioFull?.one?? " ", audioname: sura.name?? "Unknown Surah")));
                        },
                      );
                    }
                );
              }else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
