import 'dart:io';

import 'package:expandable_fab_menu/expandable_fab_menu.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sim_phone_captain/bloc/bulk_sim_bloc/bulk_sim_cubit.dart';
import 'package:sim_phone_captain/bloc/bulk_sim_bloc/bulk_sim_state.dart';
import 'package:sim_phone_captain/resources/api_providers/add_bulk_sims_api.dart';
import 'package:sim_phone_captain/screens/add_product/add_sim_screen/add_sim.dart';
import 'package:sim_phone_captain/screens/add_product/edit_sim_screen.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';
import 'package:sim_phone_captain/ui_components/show_snack_bar.dart';

import '../../bloc/all_sim_cubit/all_sims_cubit.dart';
import '../../models/api_response/all_sim_api_response.dart';
import '../../utils/api_constants/api_constants.dart';
import '../../utils/navigation_controller/navigator_screen.dart';
import 'add_data_sim_screen/add_data_sim_screen.dart';

class AllSimsScreen extends StatefulWidget {
  const AllSimsScreen({Key? key}) : super(key: key);

  @override
  _AllSimsScreenState createState() => _AllSimsScreenState();
}

class _AllSimsScreenState extends State<AllSimsScreen> {
  List<Sims> allSims = [];

  @override
  void initState() {
    context.read<AllSimsCubit>().allSims();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllSimsCubit, AllSimsState>(
      listener: (context, state) {
        if (state is FailedToFetchedSims) {
          showSnackBar(context, state.message);
        }
        if (state is FailedToDeleteSim) {
          showSnackBar(context, state.message);
        }
        if (state is AllSimsFetchedSuccessfully) {
          allSims.clear();
          allSims = state.allSims;
        }
        if (state is DeleteSimSuccessfully) {
          showSnackBar(context, state.message, type: SnackBarType.success);
          context.read<AllSimsCubit>().allSims();
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("All Sims"),
            ),
            body: ListView.builder(
              itemCount: allSims.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.5,
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            Nav.push(context, EditSimScreen(allSims[index]));
                          },
                          backgroundColor: Colors.teal.shade600,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'edit',
                        ),
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            context
                                .read<AllSimsCubit>()
                                .deleteSims(id: allSims[index].id.toString());
                          },
                          backgroundColor: Colors.deepOrange.shade600,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'delete',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.sim_card),
                              Text(
                                "${allSims[index].series} - ${allSims[index].no}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: [
                                  (allSims[index].discount != 0)
                                      ? Text(
                                          "${allSims[index].price} PKR",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : Text(
                                          "${allSims[index].price} PKR",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange),
                                        ),
                                  (allSims[index].discount != 0)
                                      ? Text(
                                          "${allSims[index].discountPrice} PKR",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          (allSims[index].package?.messages != null)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${allSims[index].package?.sameNetworkMins ?? 0}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Onnet Mint",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${allSims[index].package?.otherNetworkMins ?? 0}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Offnet Mint",
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${allSims[index].package?.data ?? ""}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "MB's",
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (allSims[index].package?.messages != null)
                                  ? Column(
                                      children: [
                                        Text(
                                          "${allSims[index].package?.messages ?? ""}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "SMS",
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          "${allSims[index].package?.data ?? ""}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "MB's",
                                        ),
                                      ],
                                    ),
                              Column(
                                children: [
                                  Text(
                                    allSims[index].package?.packageName ?? "",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Package",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
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
                  title: "Add Simple Sim",
                  titleColor: Colors.white,
                  subtitle: "You can Add a Simple sim",
                  subTitleColor: Colors.white,
                  backgroundColor: Colors.amber.shade700,
                  onTap: () {
                    Nav.push(context, const AddSimScreen());
                  },
                ),
                ExpandableFabMenuItem(
                  child: const Icon(Icons.sim_card, color: Colors.white),
                  title: "Add Multiple Sims",
                  titleColor: Colors.white,
                  subtitle: "You can Add a more then one sims at a time",
                  subTitleColor: Colors.white,
                  backgroundColor: Colors.amber.shade700,
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                    File file = File(result!.files.single.path!);

                    print(result.files.single.path);

                    // AddBulkSimsApi.uploadFileWithMultiPart(file: file);

                    _showDialog();
                    context.read<AddBulkSimsCubit>().addBulkSims(
                        series: '0203',
                        network: 'JazZ',
                        price: '9000',
                        simType: 'prepaid',
                        numberType: 'GOLDEN',
                        packageId: '628c9fab1afdf6668a0be9c3',
                        file: file);

                    /// show picker here
                  },
                ),
                ExpandableFabMenuItem(
                  child: const Icon(Icons.wifi, color: Colors.white),
                  title: "Add Data Sim",
                  titleColor: Colors.white,
                  subtitle: "You can Add a Data sim",
                  subTitleColor: Colors.white,
                  backgroundColor: Colors.green.shade700,
                  onTap: () {
                    Nav.push(context, const AddDataSimScreen());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: StatefulBuilder(
            builder: (context, setState) {
              return BlocConsumer<AddBulkSimsCubit, AddBulkSimsState>(
                listener: (context, state) {
                  if (state is FailedToAddBulk) {
                    showSnackBar(context, state.message);
                    backScreen(context);
                  }
                  if (state is AddBulkSimsSuccessfully) {
                    showSnackBar(context, state.message,
                        type: SnackBarType.success);
                    backScreen(context);
                  }
                },
                builder: (context, state) {
                  return Container(
                      height: 150,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: state is BulkLoadingState
                            ? Column(
                          mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(color: Colors.green),
                                  SizedBox(height: 15,),
                                  Text('Uploading bulk')
                                ],
                              )
                            : Container(),
                      ));
                },
              );
            },
          ),
        );
      },
    );
  }

  Future<void> backScreen(BuildContext context) async {
    context.read<AllSimsCubit>().allSims();
    Nav.pop(context);
  }
}
