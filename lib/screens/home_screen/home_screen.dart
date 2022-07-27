import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/screens/home_screen/pending_order_screen/pending_orders_screen.dart';
import 'package:sim_phone_captain/screens/home_screen/side_menu.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';
import 'package:sim_phone_captain/ui_components/show_snack_bar.dart';

import '../../bloc/dashboard_cubit/dashboard_cubit.dart';
import '../../models/api_response/dashboard_api_response.dart';
import '../../utils/navigation_controller/navigator_screen.dart';
import 'approved_orders_screen/approved_orders_screen.dart';
import 'delivered_order_screen/delivered_orders_screen.dart';
import 'rejected_orders_screen/rejected_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashboardApiResponse? dashboardApiResponse;


  @override
  void initState() {
    context.read<DashboardCubit>().getDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is FailedToFetchedDashboard) {
          showSnackBar(context, state.message);
        }
        if (state is DashboardFetchedSuccessfully) {
          dashboardApiResponse = state.dashboardApiResponse;
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
              ),
              drawer: const Drawer(
                child: SideMenu(),
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.01),
                children: [
                  InkWell(
                    onTap: (){
                      Nav.push(context, const PendingOrdersScreen());
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // side: BorderSide( width: 5, color: Colors.green),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Icon(
                              Icons.accessible,
                              color: Colors.green.shade500,
                              size: size.height * 0.05,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Pending",
                              style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w600, fontSize: size.height * 0.03),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All your pending orders",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                                Text(
                                  "${dashboardApiResponse?.allOrders?.pendingOrders ?? 0}",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Nav.push(context, const DeliveredOrderScreen());
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // side: BorderSide( width: 5, color: Colors.green),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Icon(
                              Icons.volume_up,
                              color: Colors.green.shade500,
                              size: size.height * 0.05,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Delivered",
                              style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w600, fontSize: size.height * 0.03),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All the orders that you delivered",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                                Text(
                                  "${dashboardApiResponse?.allOrders?.deliveredOrders ?? 0}",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Nav.push(context, const RejectedOrdersScreen());
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // side: BorderSide( width: 5, color: Colors.green),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Icon(
                              Icons.api,
                              color: Colors.green.shade500,
                              size: size.height * 0.05,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Rejected",
                              style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w600, fontSize: size.height * 0.03),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All your orders that have been rejected",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                                Text(
                                  "${dashboardApiResponse?.allOrders?.rejectedOrders ?? 0}",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Nav.push(context, const ApprovedOrdersScreen());
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // side: BorderSide( width: 5, color: Colors.green),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Icon(
                              Icons.blur_linear,
                              color: Colors.green.shade500,
                              size: size.height * 0.05,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Approved",
                              style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w600, fontSize: size.height * 0.03),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All your Approved orders",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                                Text(
                                  "${dashboardApiResponse?.allOrders?.approvedOrders ?? 0}",
                                  style: TextStyle(color: Colors.green.shade500, fontWeight: FontWeight.w400, fontSize: size.height * 0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
