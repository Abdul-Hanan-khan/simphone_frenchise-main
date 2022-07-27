import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim_phone_captain/models/api_response/all_sim_api_response.dart';
import 'package:sim_phone_captain/models/api_response/sim_packages_api_response.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';
import 'package:sim_phone_captain/ui_components/show_snack_bar.dart';
import 'package:sim_phone_captain/utils/navigation_controller/navigator_screen.dart';

import '../../bloc/add_new_sim_cubit/add_new_sim_cubit.dart';
import '../../bloc/all_sim_cubit/all_sims_cubit.dart' hide LoadingState;

class EditSimScreen extends StatefulWidget {
  const EditSimScreen(this.sim, {Key? key}) : super(key: key);
  final Sims sim;

  @override
  State<EditSimScreen> createState() => _EditSimScreenState();
}

class _EditSimScreenState extends State<EditSimScreen> {
  final TextEditingController _noTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _discountTextController = TextEditingController();

  String? networkValue;
  String? serialValue;
  String? typeValue;
  String? package;
  final List<String> _networks = ['JAZZ', 'UFONE', 'ZONG', 'TELENOR'];
  final List<String> _serials = [
    "0300",
    "0301",
    "0302",
    "0303",
    "0304",
    "0305",
    "0306",
    "0307",
    "0308",
    "0309",
    "0310",
    "0311",
    "0312",
    "0313",
    "0314",
    "0315",
    "0316",
    "0317",
    "0318",
    "0310",
    "0320",
    "0321",
    "0322",
    "0323",
    "0324",
    "0325",
    "0326",
    "0327",
    "0328",
    "0329",
    "0330",
    "0331",
    "0332",
    "0333",
    "0334",
    "0335",
    "0336",
    "0337",
    "0338",
    "0339",
    "0340",
    "0341",
    "0342",
    "0343",
    "0344",
    "0345",
    "0346",
    "0347",
    "0348",
    "0349"
  ];
  final List<String> _types = ["SIMPLE", "GOLDEN"];

  Future<void> _onDoneButtonPressed(BuildContext context) async {
    if (_noTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Valid No");
    }
    else if (_priceTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Price");
    }else if (_discountTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Discount Or 0");
    }
    else if (package?.isEmpty ?? true) {
      showSnackBar(context, "Please Select Package");
    }
    else {
      context.read<AddNewSimCubit>().editSim(
            series: serialValue!,
            no: _noTextController.text,
            network: networkValue!,
            discount: int.parse(_discountTextController.text),
            type: typeValue!,
            price: _priceTextController.text,
            packageId: package!,
            id: widget.sim.id!,
          );
    }
  }

  _showDialog(Packages value) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          child: AlertDialog(
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.sim_card),
                      //
                      title: Text(
                        value.packageName ?? '',
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text(userSport),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Same Network Minutes',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                        Text(
                          "${value.sameNetworkMins}",
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                          'Other Network Minutes',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                        Text(
                          "${value.otherNetworkMins}",
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                          'Data',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                        Text(
                          value.data ?? '',
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                          'Messages',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                        Text(
                          "${value.messages}",
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                          'Expairy Date',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                        Text(
                          value.expiry ?? '',
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
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

  Future<void> backScreen(BuildContext context) async {
    context.read<AllSimsCubit>().allSims();
    Nav.pop(context);
  }

  List<Packages> packages = [];

  @override
  void initState() {
    _noTextController.text = widget.sim.no.toString();
    _discountTextController.text = widget.sim.discount.toString();
    _priceTextController.text = widget.sim.price.toString();
    networkValue = widget.sim.network!.toUpperCase();
    typeValue = widget.sim.numberType!.toUpperCase();
    serialValue = widget.sim.series.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddNewSimCubit()..allSimPackages(),
      child: BlocConsumer<AddNewSimCubit, AddNewSimState>(
        listener: (context, state) {
          if (state is FailedToEditSim) {
            showSnackBar(context, state.message);
          }
          if (state is AddNewSimSuccessfully) {
            showSnackBar(context, state.message, type: SnackBarType.success);
            backScreen(context);
          }
          if (state is AllPackagesGetSuccessfully) {
            packages.clear();
            packages = state.packages;
          }if(state is EditSimSuccessfully){
            showSnackBar(context, state.message,type: SnackBarType.success);
            backScreen(context);
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Edit Sim'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      width: size.width * 0.7,
                      height: size.width * 0.4,
                      image: const AssetImage("assets/images/simphonelogo.png"),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Center(
                      child: Text(
                        "Please fill the following fields",
                        style: TextStyle(fontSize: size.height * 0.03),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(style: BorderStyle.solid, width: 0.80),
                        ),
                        child: Center(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(20),
                            value: networkValue != null ? networkValue : null,
                            hint: Text(widget.sim.network ?? ""),
                            iconSize: size.height * 0.03,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.grey.shade800,
                            ),
                            items: _networks.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                networkValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(style: BorderStyle.solid, width: 0.80),
                        ),
                        child: Center(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(20),
                            value: typeValue != null ? typeValue : null,
                            hint: Text(widget.sim.numberType ?? ""),
                            iconSize: size.height * 0.03,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.grey.shade800,
                            ),
                            items: _types.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                typeValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(style: BorderStyle.solid, width: 0.80),
                          ),
                          child: DropdownButton<String>(
                            // isExpanded: true,
                            borderRadius: BorderRadius.circular(20),
                            value: serialValue,
                            hint: Text("${widget.sim.series ?? ''}"),
                            iconSize: size.height * 0.02,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.grey.shade800,
                            ),
                            items: _serials.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                serialValue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: size.height * 0.03),
                            child: TextField(
                              controller: _noTextController,
                              maxLength: 7,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: size.height * 0.025),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: size.height * 0.02, vertical: size.height * 0.017),
                                alignLabelWithHint: true,
                                hintText: "5007500",
                                hintStyle: TextStyle(
                                  fontSize: size.height * 0.025,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Number",
                                  style: TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.001, size.width * 0.1, size.height * 0.01),
                      child: TextField(
                        controller: _priceTextController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: size.height * 0.025),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(size.height * 0.02),
                          hintText: "10,000",
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.025,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text(
                            "Price",
                            style: TextStyle(fontSize: size.height * 0.025),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.001, size.width * 0.1, size.height * 0.01),
                      child: TextField(
                        controller: _discountTextController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: size.height * 0.025),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(size.height * 0.02),
                          hintText: "discount",
                          hintStyle: TextStyle(
                            fontSize: size.height * 0.025,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text(
                            "Discount",
                            style: TextStyle(fontSize: size.height * 0.025),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(style: BorderStyle.solid, width: 0.80),
                        ),
                        child: Center(
                          child: DropdownButton<dynamic>(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(20),
                            value: package != null ? package : null,
                            hint: const Text("Select Package"),
                            iconSize: size.height * 0.03,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: TextStyle(
                              fontSize: size.height * 0.03,
                              color: Colors.grey.shade800,
                            ),
                            items: packages.map<DropdownMenuItem>((value) {
                              return DropdownMenuItem<String>(
                                value: value.id,
                                child: GestureDetector(
                                    onLongPress: () {
                                      _showDialog(value);
                                    },
                                    child: Text(value.packageName!)),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                package = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
                          _onDoneButtonPressed(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(size.height * 0.012),
                          child: Text(
                            "Edit Sim",
                            style: TextStyle(fontSize: size.height * 0.025),
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
      ),
    );
  }
}
