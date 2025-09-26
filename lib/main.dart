import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/RoutesManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
      builder: (context,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
         onGenerateRoute: RoutesManager.getRoute,
          initialRoute: RoutesManager.chooseLoginRegister,
        );
      }
    );
  }
}
