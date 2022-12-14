import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim_phone_captain/models/api_response/captain_orders_api_response.dart';
import 'package:sim_phone_captain/screens/order_screen/order_detail_screen/order_detail_screen.dart';

import '../../../bloc/order_cubit/orders_cubit.dart';
import '../../ui_components/loading_screen_animation.dart';
import '../../ui_components/show_snack_bar.dart';
import '../../utils/navigation_controller/navigator_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final List<Orders> orders = [];

  @override
  void initState() {
    context.read<OrdersCubit>().allOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if(state is FailedToFetchedOrders){
          showSnackBar(context, state.message);
        }if(state is AllOrderFetchedSuccessfully){
          orders.clear();
          orders.addAll(state.orders);
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Order'),
            ),
            body: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Nav.push(context, OrderDetailScreen(orders[index]));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text('Order No', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(orders[index].id ?? "",
                                style: const TextStyle(fontSize: 14,color: Colors.black54, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              (orders[index].product?.type == "sim") ? const Text('Number', style: TextStyle(fontWeight: FontWeight.bold)) : const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)) ,
                              Text(orders[index].product?.nameOrNum ?? "",
                                style: const TextStyle(fontSize: 14,color: Colors.black54, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("${orders[index].totalBill}",
                                style: const TextStyle(fontSize: 14,color: Colors.black54, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(orders[index].status ?? "",
                                style: const TextStyle(fontSize: 14,color: Colors.black54, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text('Customer Name', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(orders[index].customer?.name ?? "",
                                style: const TextStyle(fontSize: 14,color: Colors.black54, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
