import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotifyyapp/Features/AudioProfile/AudioPlayer.dart';
import 'package:spotifyyapp/Logic/BloC/LogicRadio.dart';
import 'package:spotifyyapp/data/user_repo.dart';

import '../../../Core/ColorsManager.dart';

class RadioScreen extends StatefulWidget {
   final UserRepo repo;
  const RadioScreen({super.key, required this.repo});


  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("RadioPage",style: GoogleFonts.inter(color: ColorsManager.green,fontSize: 22.sp,fontWeight: FontWeight.bold),),
      ),
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocProvider(create: (context)=> RadioCubit(widget.repo)..fetchRadioStations(),
      child: BlocBuilder<RadioCubit,RadioState>(builder:(context,state){
      if(state is RadioError){
        return Center(
          child: Text("Error in Fetching Data",style: GoogleFonts.inter(color: ColorsManager.red,fontWeight: FontWeight.bold,fontSize: 30.sp),),
        );
      }else if(state is RadioLoading){
        return Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
      }  else if(state is RadioLoaded){
        final radios=state.responses.radios??[];
        return ListView.separated(
            separatorBuilder: (context,index)=> SizedBox(height: 10.h,),
            itemCount: radios.length,
            itemBuilder: (context,index){
              final radio=radios[index];
              return ListTile(
                title: Text("${radio.name}",style: GoogleFonts.inter(color: ColorsManager.green,fontSize: 19.sp,fontWeight: FontWeight.bold),),
                subtitle:Text("${radio.url}",style: GoogleFonts.inter(color: ColorsManager.green,fontSize: 10.sp,fontWeight: FontWeight.w400),),
                onTap: (){
                  Navigator.push(context,CupertinoPageRoute(builder: (_)=> AudioPlayerScreen(audioUrl: radio.url??" ", audioname: radio.name??" ")));
                },
              );
          }
        );
      }else {
        return SizedBox();
      }
      }
        ),
      )
      );
  }
}
