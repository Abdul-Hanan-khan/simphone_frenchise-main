import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sim_phone_captain/models/api_response/captain_orders_api_response.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';

import '../../../bloc/order_cubit/orders_cubit.dart' hide LoadingState;
import '../../../bloc/order_status_update_cubit/order_update_status_cubit.dart';
import '../../../models/api_response/all_captain_api_response.dart';
import '../../../ui_components/show_snack_bar.dart';
import '../../../utils/navigation_controller/navigator_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen(this.order, {Key? key}) : super(key: key);
  final Orders order;

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  TextEditingController dateInput = TextEditingController();
  String? _dropDownValue;
  String? captainId;

  Future<void> _orderChangeButtonPressed({required BuildContext context, required String id}) async {
    if (_dropDownValue!.isEmpty) {
      showSnackBar(context, "Please Select Status");
    } else if (dateInput.text.isEmpty) {
      showSnackBar(context, "Please Select Delivery Date");
    } else {
      if(captainId == null) {
        context.read<OrderUpdateStatusCubit>().statusUpdate(status: _dropDownValue!, id: id, date: dateInput.text);
      }else{
        context.read<OrderUpdateStatusCubit>().statusUpdate(status: _dropDownValue!, id: id, date: dateInput.text,captainId: captainId);

      }
      }
  }

  backScreen(BuildContext context) async {
    context.read<OrdersCubit>().allOrders();
    Nav.pop(context);
  }

  List<Captains>? captains = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OrderUpdateStatusCubit()..allCaptain(),
      child: BlocConsumer<OrderUpdateStatusCubit, OrderUpdateStatusState>(
        listener: (context, state) {
          if (state is FailedToUpdateOrder) {
            showSnackBar(context, state.message);
          }
          if (state is OrderUpdateSuccessfully) {
            showSnackBar(context, state.message, type: SnackBarType.success);
            backScreen(context);
          }if(state is AllCaptainGetSuccessfully){
            captains?.clear();
            captains?.addAll(state.captains!);
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
                child: Scaffold(
              appBar: AppBar(
                title: const Text("Order Detail"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Order No', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.id ?? "",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (widget.order.product?.type == "sim")
                            ? const Text('Number', style: TextStyle(fontWeight: FontWeight.bold))
                            : const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.product?.nameOrNum ?? "",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.order.totalBill}",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Captain Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.franchise?.name ?? "",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            MapsLauncher.launchQuery(widget.order.deliveryAddress!);
                          },
                          child: SizedBox(
                            width: size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.location_on),
                                Expanded(
                                  child: Text(
                                    widget.order.deliveryAddress ?? "",
                                    maxLines: 5,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Delivered Date", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                          //icon of text field
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                          ) //label text of field
                          ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          final String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement
                          dateInput.text = formattedDate; //set output date to TextField value.

                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        DropdownButton(
                          value: _dropDownValue,
                          // isExpanded: true,
                          hint: Text(widget.order.status ?? "Select Status"),
                          iconSize: 30.0,
                          style: const TextStyle(color: Colors.black),
                          items: ['approved', 'rejected'].map(
                            (String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              _dropDownValue = val;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    (widget.order.status == "pending")? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(style: BorderStyle.solid, width: 0.80),
                      ),
                      child: Center(
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(20),
                          value: captainId != null ? captainId : null,
                          hint: const Text("Select Captain"),
                          iconSize: size.height * 0.03,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            color: Colors.grey.shade800,
                          ),
                          items: captains?.map<DropdownMenuItem>((value) {
                            return DropdownMenuItem<String>(
                              value: value.id,
                              child: GestureDetector(
                                  onLongPress: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value.name ?? ""),
                                  )),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              captainId = newValue;
                            });
                          },
                        ),
                      ),
                    ):const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.green.shade400),
                        ),
                        onPressed: () {
                          _orderChangeButtonPressed(context: context, id: widget.order.id!);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(size.height * 0.012),
                          child: Text(
                            "Update Order",
                            style: TextStyle(fontSize: size.height * 0.025),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
