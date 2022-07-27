import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/api_response/add_device_api_response.dart';
import '../../models/api_response/all_phone_api_response.dart';
import '../../resources/repository.dart';

part 'all_phones_state.dart';

class AllPhonesCubit extends Cubit<AllPhonesState> {
  AllPhonesCubit() : super(AllPhonesInitial());

  final repository = Repository();

  Future<void> allPhones() async {
    emit(LoadingState());
    final AllPhoneApiResponse apiResponse = await repository.allPhone();
    if (apiResponse.result == true) {
      emit(AllPhonesFetchedSuccessfully(apiResponse.mobiles!));
    } else {
      emit(FailedToFetchedPhone(apiResponse.message ?? "Failed To Fetched Phones!"));
    }
  }

  Future<void> addDevice({required String id, required String dType, required int qty}) async {
    emit(LoadingState());
    var _formData = {
      '_id': id,
      'deviceType': dType,
      'qty': qty,
    };
    final AddDeviceApiResponse apiResponse = await repository.addDevice(_formData);
    if (apiResponse.result == true) {
      emit(AddDeviceSuccessfully(apiResponse.message ?? "Add Device Successfully"));
    } else {
      emit(const FailedToAddDevice("Failed To Add Device!"));
    }
  }
}
