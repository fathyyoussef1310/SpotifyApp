import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';

import '../../../Core/ColorsManager.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       title: Image.asset(assetsManager.SpotifyLogo,height: 40.h,width: 112.w,),
       centerTitle: true,
        leading:IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,color: ColorsManager.green,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: ColorsManager.white,)),
        ],
      ),
    );
  }
}
