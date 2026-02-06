import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:spotifyyapp/Core/ColorsManager.dart';
import 'package:spotifyyapp/Features/AudioProfile/AudioPlayer.dart';
import 'package:spotifyyapp/Features/MainFeatures/Favourites%20songs/FavouritesManager.dart';
class Favoritessongs extends StatelessWidget {
  const Favoritessongs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Favouritesmanager>(context);
    final favitems = provider.FavQuran;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorites",style: GoogleFonts.aboreto(),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: favitems.isEmpty ? Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/empthyfav.json", width: 800.w),
            SizedBox(height: 20.h),
            Text("No favorites yet!", style: GoogleFonts.aboreto(color: ColorsManager.Greyissh.withOpacity(0.8), fontSize: 16),),
          ],
        ),
      ) : ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: favitems.length,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          final fav = favitems[index];
          return ListTile(
            leading: IconButton(onPressed: (){
              provider.toggleData(fav);
            }, icon: Icon(CupertinoIcons.delete,color: ColorsManager.green,)),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(88.sp),
              side: BorderSide(color: ColorsManager.green),
            ),
            title: Text(fav.name??" "),
            subtitle: Text(fav.englishName ?? "",style: GoogleFonts.inter(color: ColorsManager.green,fontWeight: FontWeight.bold,fontSize: 20.sp)),
            trailing:Text("${fav.numberOfAyahs}",style: GoogleFonts.inter(color: ColorsManager.green,fontSize: 20.sp),),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=> AudioPlayerScreen(audioUrl: fav.audioFull?.one ?? " ", audioname: fav.englishName ?? " ")));
            },
          );
        },
      ),
    );
  }
}