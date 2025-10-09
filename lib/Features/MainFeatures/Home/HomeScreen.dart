import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotifyyapp/Controllers/ThemeController.dart';
import 'package:spotifyyapp/Core/ImagesManager.dart';
import 'package:spotifyyapp/Features/AudioProfile/SongsItem.dart';
import 'package:spotifyyapp/Features/MainFeatures/Home/Catagories/Catagories.dart';
import '../../../Core/ColorsManager.dart';
import '../../AudioProfile/songs.dart';
import 'Catagories/CatagoriesModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int cIndex = 0;

List<Catagories> catagories = [
  Catagories(name: "All", icon: Icons.all_inclusive_rounded),
  Catagories(name: "Songs", icon: Icons.music_note),
  Catagories(name: "Podcasts", icon: Icons.podcasts),
];

List<songs> songsList = [
  songs(name: "3enba - Mosim El Nabr", path: 'assets/Audio/3enba_mosim_el_nabr.m4a'),
  songs(name: "Abd El Fatah El Greny - Ashof Fek Youm", path: 'assets/Audio/AbdElFatahElGreny - AshofFekYoum .m4a'),
  songs(name: "Nghamet El Herman", path: 'assets/Audio/NghametElherman.mp3'),
];

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: catagories.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Image.asset(
            assetsManager.SpotifyLogo,
            height: 40.h,
            width: 112.w,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded, color: ColorsManager.green)),
          actions: [
            IconButton(
                onPressed: () {
                  Get.find<ThemeController>().toggleData(true);
                },
                icon: const Icon(Icons.dark_mode)),
            IconButton(
                onPressed: () {
                  Get.find<ThemeController>().toggleData(false);
                },
                icon: const Icon(Icons.light_mode))
          ],
        ),
        body: Column(
          children: [
            TabBar(
              onTap: (value) {
                setState(() {
                  cIndex = value;
                });
              },
              isScrollable: true,
              indicatorColor: ColorsManager.green,
              tabs: catagories.map((cat) {
                int index = catagories.indexOf(cat);
                return Tab(
                  child: CategoryItem(
                    category: cat,
                    selectedBackgroundColor: Colors.transparent,
                    unselectedBackgroundColor: Colors.transparent,
                    selectedFourBackgroundColor: ColorsManager.green,
                    unselectedFourBackgroundColor: ColorsManager.whiteGrey,
                    isSelected: cIndex == index,
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: songsList.map((cat) {
                  return ListView.separated(
                    itemCount: songsList.length,
                    itemBuilder: (context, index) {
                      final song = songsList[index];
                      return SongsItem(song: song);
                    }, separatorBuilder: (BuildContext context, int index)=> SizedBox(height: 1.h,),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
