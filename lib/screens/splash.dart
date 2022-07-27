import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/screens/home_screen/home_screen.dart';
import 'package:sim_phone_captain/screens/walkthrough.dart';

import '../utils/navigation_controller/navigator_screen.dart';
import 'bottom_nav_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
   Future.delayed(const Duration(seconds: 3)).then((value) {
     if (GetStorage().read('token') != null) {
       Timer(const Duration(seconds: 1), () => Nav.pushAndRemoveAllRoute(context, const BottomNavigationBarScreen()));
     } else {
       Timer(const Duration(seconds: 1), () => Nav.push(context, const WalkThroughScreen()));
     }
   });

    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage("assets/images/simphonelogo.png"),
          ),
        ),
      ),
    );
  }
}
