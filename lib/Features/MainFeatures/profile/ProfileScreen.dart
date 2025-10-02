import 'package:flutter/material.dart';
import '../../../Core/ColorsManager.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:  Center(child: Text("Profile Screen", style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
