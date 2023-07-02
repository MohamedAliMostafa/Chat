import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../StateManagment/Provider.dart';
import 'Home/HomeScreen.dart';
import 'Login/Login.dart';

class SplashScreen extends StatelessWidget {
  static const String routename="spls";

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<Mypro>(context);
    return AnimatedSplashScreen(
      splash: Container(
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 5),
          image: const DecorationImage(image: AssetImage("assets/images/splash.jpg"),),
          borderRadius: BorderRadius.only(topRight: Radius.circular(44.r),topLeft: Radius.circular(44.r),bottomLeft: Radius.circular(44.r))
        ),
      ),splashIconSize: 180,
      nextScreen:pro.user==null?Login():HomeScreen(),
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
