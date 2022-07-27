import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sim_phone_captain/models/api_response/add_new_sim_api_response.dart';
import 'package:sim_phone_captain/models/api_response/sim_packages_api_response.dart';

import '../../models/api_response/data_sim_packages_api_response.dart';
import '../../models/api_response/edit_sim_api_response.dart';
import '../../resources/repository.dart';

part 'add_new_sim_state.dart';

class AddNewSimCubit extends Cubit<AddNewSimState> {
  AddNewSimCubit() : super(AddNewSimInitial());

  final repository = Repository();

  Future<void> allSimPackages() async {
    emit(LoadingState());
    final SimPackagesApiResponse apiResponse = await repository.allPackagesRequest();
    if (apiResponse.result == true) {
      emit(AllPackagesGetSuccessfully(apiResponse.packages!));
    } else {
      emit(FailedToFetchedData(apiResponse.message ?? "Failed To Fetched Phones!"));
    }
  }
  Future<void> allDataSimPackages() async {
    emit(LoadingState());
    final DataSimPackagesApiResponse apiResponse = await repository.allDataPackagesRequest();
    if (apiResponse.result == true) {
      emit(AllDataPackagesGetSuccessfully(apiResponse.packages!));
    } else {
      emit(FailedToFetchedData(apiResponse.message ?? "Failed To Fetched Phones!"));
    }
  }

  Future<void> addNewSim(
      {required String series,
      required String no,
      required String network,
      required String price,
      required String simType,
      required String numberType,
      required String packageId,
      required int discount}) async {
    emit(LoadingState());
    var _formData = {
      'series': series,
      'no': no,
      'network': network,
      'price': price,
      'simType': simType,
      'numberType': numberType,
      'packageId': packageId,
      'discount': discount,
    };
    print(_formData);
    final AddNewSimApiResponse apiResponse = await repository.addSim(_formData);
    if (apiResponse.result == true) {
      // storeToken(signInModel.data!.token!);
      emit(AddNewSimSuccessfully(apiResponse.message ?? "Add New Sim Successfully"));
    } else {
      emit(FailedToAddNewSim(apiResponse.message ?? "Failed To Add New Sim!"));
    }
  }

  Future<void> editSim(
      {required String series,
      required String no,
      required String network,
      required String price,
      required String type,
      required String packageId,
      required String id,
      required int discount}) async {
    emit(LoadingState());
    var _formData = {
      'series': series,
      'no': no,
      'network': network,
      'price': price,
      'type': type,
      'packageId': packageId,
      'discount': discount,
    };
    print(_formData);
    final EditSimApiResponse apiResponse = await repository.editSimRequest(_formData, id);
    if (apiResponse.result == true) {
      // storeToken(signInModel.data!.token!);
      emit(EditSimSuccessfully(apiResponse.message ?? "Edit Sim Successfully"));
    } else {
      emit(FailedToEditSim(apiResponse.message ?? "Failed Edit Sim!"));
    }
  }
}
