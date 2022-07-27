import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sim_phone_captain/models/api_response/captain_mobile_api_response.dart';

import '../../resources/repository.dart';

part 'captain_mobile_state.dart';

class CaptainMobileCubit extends Cubit<CaptainMobileState> {
  CaptainMobileCubit() : super(CaptainMobileInitial());

  final repository = Repository();

  Future<void> captainMobile() async {
    emit(LoadingState());
    final CaptainMobileApiResponse apiResponse = await repository.captainMobile();
    if (apiResponse.result == true) {
      emit(CaptainMobileFetchedSuccessfully(apiResponse.devices!));
    } else {
      emit(FailedToFetchedData(apiResponse.message ?? "Failed To Fetched Mobile!"));
    }
  }


}
