import 'package:chat/Screen/AddRooms/AddROOMS.dart';
import 'package:chat/Screen/Chat/ChatScreen.dart';
import 'package:chat/Screen/Home/HomeScreen.dart';
import 'package:chat/Screen/Login/Login.dart';
import 'package:chat/Screen/Sign_Up/Sign_UP.dart';
import 'package:chat/Screen/Splash.dart';
import 'package:chat/StateManagment/Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(
      create: (context) => Mypro(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<Mypro>(context);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routename,
            routes: {
              SignUp.RouteName: (context) => SignUp(),
              Login.Routename: (context) => Login(),
              HomeScreen.RouteName: (context) => HomeScreen(),
              AddRooms.RouteName:(context)=>AddRooms(),
              ChatScreen.ROUTEName:(context)=>ChatScreen(),
              SplashScreen.routename:(context)=>SplashScreen()
            },
          );
        }
    );
  }
}