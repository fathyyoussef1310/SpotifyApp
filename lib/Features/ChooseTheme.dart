import 'package:flutter/material.dart';
import '../Core/ColorsManager.dart';

class Choosetheme extends StatelessWidget {
  const Choosetheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlack,
    );
  }
}
