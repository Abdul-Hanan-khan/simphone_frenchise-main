import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sim_phone_captain/models/api_response/captain_mobile_api_response.dart';

import '../../resources/repository.dart';

part 'captain_devices_state.dart';

class CaptainDevicesCubit extends Cubit<CaptainDevicesState> {
  CaptainDevicesCubit() : super(CaptainDevicesInitial());

  final repository = Repository();

  Future<void> captainDevices() async {
    emit(LoadingState());
    final CaptainMobileApiResponse apiResponse = await repository.captainDevice();
    if (apiResponse.result == true) {
      emit(CaptainMobileFetchedSuccessfully(apiResponse.devices!));
    } else {
      emit(FailedToFetchedData(apiResponse.message ?? "Failed To Fetched Devices!"));
    }
  }
}
