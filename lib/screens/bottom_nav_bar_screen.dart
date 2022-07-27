import 'package:expandable_fab_menu/expandable_fab_menu.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sim_phone_captain/screens/add_product/add_phone_screen/captain_mobiles_screen.dart';
import 'package:sim_phone_captain/screens/home_screen/home_screen.dart';
import 'package:sim_phone_captain/screens/order_screen/order_screen.dart';

import '../utils/navigation_controller/navigator_screen.dart';
import 'add_product/add_phone_screen/all_phone_screen.dart';
import 'add_product/add_wifi_devices/all_captain_devices_screen.dart';
import 'add_product/all_sims_screen.dart';
import 'add_product/add_wifi_devices/all_devices_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var _currentIndex = 0;

  final tab = [const HomeScreen(),const HomeScreen(),  const OrderScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: tab[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ExpandableFabMenu(
          marginBottom: size.height * 0.01,
          onPress: () {},
          fabAlignment: Alignment.bottomCenter,
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: const IconThemeData(size: 22.0),
          child: const Icon(Icons.close),
          backgroundColor: Colors.green.shade500,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          scrollVisible: true,
          //bool
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          children: [
            ExpandableFabMenuItem(
              child: const Icon(Icons.sim_card, color: Colors.white),
              title: "My Sims",
              titleColor: Colors.white,
              subtitle: "You can Add a sim",
              subTitleColor: Colors.white,
              backgroundColor: Colors.amber.shade700,
              onTap: () {
                Nav.push(context, const AllSimsScreen());
              },
            ),
            ExpandableFabMenuItem(
              child: const Icon(Icons.wifi, color: Colors.white),
              title: "My wifi devices",
              titleColor: Colors.white,
              subtitle: "You Can add wifi devies in your account.",
              subTitleColor: Colors.white,
              backgroundColor: Colors.green.shade700,
              onTap: () {
                Nav.push(context, const AllCaptainWifiDeviceScreen());
              },
            ),
            ExpandableFabMenuItem(
              child: const Icon(Icons.phone_android, color: Colors.white),
              title: "My Mobile",
              titleColor: Colors.white,
              subtitle: "You Can edit a group",
              subTitleColor: Colors.white,
              backgroundColor: Colors.blue.shade800,
              onTap: () {
                Nav.push(context, const AllCaptainPhonesScreen());
              },
            ),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          curve: Curves.linear,
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.01),
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(
              () {
                _currentIndex = i;
              },
            );
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.green.shade400,
            ),

            SalomonBottomBarItem(
              icon: const SizedBox(),
              title: const Text(""),
              selectedColor: Colors.transparent,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.delivery_dining),
              title: const Text("Order"),
              selectedColor: Colors.green.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
