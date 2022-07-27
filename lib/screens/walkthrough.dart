import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:sim_phone_captain/screens/get_started.dart';

import 'login.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<OnbordingData> list = [
      OnbordingData(
        image: const AssetImage("assets/images/delivery-bike.png"),
        imageHeight: size.height * 0.3,
        imageWidth: size.width * 0.8,
        fit: BoxFit.contain,
        descPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        titleText: Text(
          "Captain's Access",
          style: TextStyle(
            fontSize: size.height * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
        descText: Text(
          "If you are a delivery captain you will have access to your dashboard where you will be able"
              " to see you orders completed and in-progress. You will be able to add new sim cards, devices, "
              "cell phones and change previous ones. You will also be able to see and edit your profile.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size.height * 0.02,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      OnbordingData(
        image: const AssetImage("assets/images/sim-toolkit.png"),
        imageHeight: size.height * 0.3,
        imageWidth: size.width * 0.8,
        fit: BoxFit.contain,
        descPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        titleText: Text(
          "Sell Products",
          style: TextStyle(
            fontSize: size.height * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
        descText: Text(
          "Whether you’re a shopkeeper, student, or stay-at-home mum, there are plenty of opportunities to be a SimPhone Trader and sell sim cards",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size.height * 0.02,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: IntroScreen(
          onbordingDataList: list,
          colors: const [
            //list of colors for per pages

            Colors.green
          ],
          pageRoute: MaterialPageRoute(
            builder: (context) => const Login(),
          ),
          nextButton: Text(
            "NEXT",
            style: TextStyle(
              color: Colors.green.shade400,
            ),
          ),
          lastButton: Text(
            "GOT IT",
            style: TextStyle(
              color: Colors.green.shade400,
            ),
          ),
          skipButton: Text(
            "SKIP",
            style: TextStyle(
              color: Colors.green.shade400,
            ),
          ),
          selectedDotColor: Colors.green.shade400,
          unSelectdDotColor: Colors.grey,
        ),
      ),
    );
  }
}
