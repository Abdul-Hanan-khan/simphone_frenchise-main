import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sim_phone_captain/models/api_response/all_devices_api_response.dart';

import '../../models/api_response/add_device_api_response.dart';
import '../../resources/repository.dart';

part 'all_devices_state.dart';

class AllDevicesCubit extends Cubit<AllDevicesState> {
  AllDevicesCubit() : super(AllDevicesInitial());


  final repository = Repository();

  Future<void> allDevices() async {
    emit(LoadingState());
    final AllDevicesApiResponse apiResponse = await repository.allDevices();
    if (apiResponse.result == true) {
      emit(AllDevicesFetchedSuccessfully(apiResponse.devices!));
    } else {
      emit(FailedToFetchedDevices(apiResponse.message ?? "Failed To Fetched Devices!"));
    }
  }

  Future<void> addDevice({required String id, required String dType,required int qty}) async {
    emit(LoadingState());
    var _formData = {'_id': id, 'deviceType': dType, 'qty': qty,};
    final AddDeviceApiResponse apiResponse = await repository.addDevice(_formData);
    if (apiResponse.result == true) {
      emit(AddDeviceSuccessfully(apiResponse.message ?? "Add Device Successfully"));
    } else {
      emit(const FailedToFetchedDevices("Failed To Add Device!"));
    }
  }

}
