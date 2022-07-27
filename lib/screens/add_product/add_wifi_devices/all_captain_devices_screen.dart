import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim_phone_captain/bloc/captain_device_cubit/captain_devices_cubit.dart';
import 'package:sim_phone_captain/models/api_response/captain_mobile_api_response.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';
import 'package:sim_phone_captain/ui_components/show_snack_bar.dart';
import 'package:sim_phone_captain/utils/api_constants/api_constants.dart';

import '../../../utils/navigation_controller/navigator_screen.dart';
import 'all_devices_screen.dart';

class AllCaptainWifiDeviceScreen extends StatefulWidget {
  const AllCaptainWifiDeviceScreen({Key? key}) : super(key: key);

  @override
  _AllCaptainWifiDeviceScreenState createState() =>
      _AllCaptainWifiDeviceScreenState();
}

class _AllCaptainWifiDeviceScreenState
    extends State<AllCaptainWifiDeviceScreen> {
  List<Devices> allDevices = [];

  @override
  void initState() {
    context.read<CaptainDevicesCubit>().captainDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<CaptainDevicesCubit, CaptainDevicesState>(
      listener: (context, state) {
        if (state is FailedToFetchedData) {
          showSnackBar(context, state.message);
        }
        if (state is CaptainMobileFetchedSuccessfully) {
          allDevices.clear();
          allDevices = state.mobile;
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("My Inventory"),
              actions: [
                IconButton(
                    onPressed: () {
                      Nav.push(context, const AllDevicesScreen());
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            body: ListView.builder(
              itemCount: allDevices.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.grey.shade200,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                        child: Column(
                          children: [
                            Image.network(
                                "${ApiConstants.baseUrl}${allDevices[index].pics?.first}",height: 100),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Device Type",
                                      style: TextStyle(
                                          fontSize: size.height * 0.020,

                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Text(
                                      allDevices[index].deviceType ?? '',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Device Name",
                                      style: TextStyle(
                                          fontSize: size.height * 0.020,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Text(
                                      allDevices[index].name ?? '',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Device Price",
                                      style: TextStyle(
                                          fontSize: size.height * 0.020,

                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Text(
                                      "${allDevices[index].price} PKR",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Quantity",
                                      style: TextStyle(
                                          fontSize: size.height * 0.020,

                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.12,
                                    ),
                                    Text(
                                      "${allDevices[index].qty}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
