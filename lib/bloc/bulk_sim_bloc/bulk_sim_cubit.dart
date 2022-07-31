import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim_phone_captain/bloc/bulk_sim_bloc/bulk_sim_state.dart';
import 'package:sim_phone_captain/models/api_response/add_bulk_sims_response.dart';

import '../../resources/repository.dart';
// part 'bulk_sim_state.dart.dart';

class AddBulkSimsCubit extends Cubit<AddBulkSimsState> {
  AddBulkSimsCubit() : super(AddBulkSimsInitial());

  final repository = Repository();


  Future<void> addBulkSims({
    required String series,
    required String network,
    required String price,
    required String simType,
    required String numberType,
    required String packageId,
    required File file,

  }) async {
    emit(BulkLoadingState());
    var _formData = {
      'series': series,
      'network': network,
      'price': price,
      'simType': simType,
      'numberType': numberType,
      'packageId': packageId,
      'simsFile': file ,
    };
    print(_formData);
    final AddBulkSimsModal apiResponse = await repository.addBulkSims(_formData,file);
    if (apiResponse.result == true) {
      // storeToken(signInModel.data!.token!);
      emit(AddBulkSimsSuccessfully(
          apiResponse.message ?? "Add New Sim Successfully"));
    } else {
      emit(FailedToAddBulk(apiResponse.message ?? "Failed To Add New Sim!"));
    }
  }
}
