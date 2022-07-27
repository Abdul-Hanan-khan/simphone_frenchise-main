import 'package:expandable_fab_menu/expandable_fab_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sim_phone_captain/screens/home_screen/all_captain_screen/add_new_captain_screen/add_new_captain_screen.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';
import 'package:sim_phone_captain/ui_components/show_snack_bar.dart';

import '../../../bloc/all_captain_cubit/all_captain_cubit.dart';
import '../../../models/api_response/all_captain_api_response.dart';
import '../../../utils/navigation_controller/navigator_screen.dart';

class AllCaptainScreen extends StatefulWidget {
  const AllCaptainScreen({Key? key}) : super(key: key);

  @override
  _AllCaptainScreenState createState() => _AllCaptainScreenState();
}

class _AllCaptainScreenState extends State<AllCaptainScreen> {

  List<Captains>? captains = [];

  @override
  void initState() {
    context.read<AllCaptainCubit>().allCaptain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllCaptainCubit, AllCaptainState>(
      listener: (context, state) {
        if(state is FailedToFetchedAllCaptain){
          showSnackBar(context, state.message);
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
              title: const Text("All Captain"),
            ),
            body: ListView.builder(
              itemCount: captains!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.5,
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {},
                          backgroundColor: Colors.teal.shade600,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'edit',
                        ),
                        SlidableAction(
                          onPressed: (BuildContext context) {},
                          backgroundColor: Colors.deepOrange.shade600,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'delete',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Name",
                                style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                captains?[index].name ?? "",
                                style: const TextStyle(fontSize: 16),
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
                                "Email",
                                style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                captains?[index].email ?? "",
                                style: const TextStyle(fontSize: 16),
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
                                "Phone",
                                style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                captains?[index].phone ?? "",
                                style: const TextStyle(fontSize: 16),
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
                                "CNIC",
                                style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${captains?[index].cnic ?? ""}",
                                style: const TextStyle(fontSize: 16),
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
                                "Address",
                                style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Text(

                                  captains?[index].address ?? "",
                                  maxLines: 3,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(fontSize: 16),
                                ),
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
                      title: "Add Captain",
                      titleColor: Colors.white,
                      subtitle: "You can Add Captain",
                      subTitleColor: Colors.white,
                      backgroundColor: Colors.amber.shade700,
                      onTap: () {
                        Nav.push(context, const AddNewCaptainScreen());
                      },
                    ),

                  ],
                ),
          )),
        );
      },
    );
  }
}
