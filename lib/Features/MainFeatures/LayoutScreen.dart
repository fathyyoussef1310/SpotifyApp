import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotifyyapp/Features/MainFeatures/profile/ProfileScreen.dart';
import 'package:spotifyyapp/data/user_repo.dart';
import '../../Core/ColorsManager.dart';
import 'Radio/RadioScreen.dart';
import 'Favourites songs/FavoritesSongs.dart';
import 'Home/HomeScreen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _SelectedTab = 0;

  final List<Widget> _tabs = [
    Homescreen(),
    RadioScreen(repo: UserRepo(),),
    Favoritessongs(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _tabs[_SelectedTab],
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 30.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(CupertinoIcons.home,0),
            _buildIcon(CupertinoIcons.radiowaves_right,1),
            _buildIcon(CupertinoIcons.heart_solid,2),
            _buildIcon(CupertinoIcons.person,3),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon,int index) {
    final bool IsSelected = _SelectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() { ///// VIP
          _SelectedTab = index;
        });
      },
      child: Icon(icon, color: IsSelected ? ColorsManager.green : ColorsManager.whiteGrey, size: 40.sp,),
    );
  }
}
