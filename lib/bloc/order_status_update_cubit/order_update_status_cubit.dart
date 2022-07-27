import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/api_response/all_captain_api_response.dart';
import '../../models/api_response/order_update_api_response.dart';
import '../../resources/repository.dart';

part 'order_update_status_state.dart';

class OrderUpdateStatusCubit extends Cubit<OrderUpdateStatusState> {
  OrderUpdateStatusCubit() : super(OrderUpdateStatusInitial());

  final repository = Repository();

  Future<void> statusUpdate({required String status, required String id, required String date,String? captainId}) async {
    emit(LoadingState());
    var _formData;
    if(captainId == null){
      _formData = {"deliveryTime": date, "status": status};
    }else{
      _formData = {"deliveryTime": date, "status": status,"captain":captainId};
    }
    print(_formData);
    final OrderUpdateApiResponse apiResponse = await repository.orderUpdateRequest(_formData, id);
    if (apiResponse.result == true) {
      emit(OrderUpdateSuccessfully(apiResponse.message ?? "Update Order Successfully"));
    } else {
      emit(FailedToUpdateOrder(apiResponse.message ?? "Failed Update Order!"));
    }
  }

  Future<void> allCaptain() async {
    emit(LoadingState());
    final AllCaptainApiResponse apiResponse = await repository.allCaptainRequest();
    if (apiResponse.result == true) {
      emit(AllCaptainGetSuccessfully(apiResponse.captains!));
    } else {
      emit(FailedToFetchedAllCaptain(apiResponse.message ?? "Failed To Fetched All Captain!"));
    }
  }

}
