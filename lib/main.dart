import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/bloc/all_phones_cubit/all_phones_cubit.dart';
import 'package:sim_phone_captain/bloc/drawer_cubit/drawer_cubit.dart';
import 'package:sim_phone_captain/screens/splash.dart';

import 'bloc/all_captain_cubit/all_captain_cubit.dart';
import 'bloc/all_devices_cubit/all_devices_cubit.dart';
import 'bloc/all_sim_cubit/all_sims_cubit.dart';
import 'bloc/captain_device_cubit/captain_devices_cubit.dart';
import 'bloc/captain_mobile_cubit/captain_mobile_cubit.dart';
import 'bloc/dashboard_cubit/dashboard_cubit.dart';
import 'bloc/order_cubit/orders_cubit.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllSimsCubit(),
        ),
        BlocProvider(
          create: (context) => AllDevicesCubit(),
        ),
        BlocProvider(
          create: (context) => AllPhonesCubit(),
        ),
        BlocProvider(
          create: (context) => CaptainMobileCubit(),
        ),
        BlocProvider(
          create: (context) => CaptainDevicesCubit(),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(),
        ),
        BlocProvider(create: (context) => DashboardCubit(),
        ),
        BlocProvider(create: (context) => AllCaptainCubit(),
        ),
        BlocProvider(create: (context) => DrawerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Sim & Phone Captain',
        theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: AppBarTheme(centerTitle: true, color: Colors.green.shade400)),
        home: const SplashScreen(),
      ),
    );
  }
}
