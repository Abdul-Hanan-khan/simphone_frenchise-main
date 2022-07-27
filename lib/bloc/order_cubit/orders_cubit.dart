import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sim_phone_captain/models/api_response/captain_orders_api_response.dart';

import '../../resources/repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  final repository = Repository();

  Future<void> allOrders() async {
    emit(LoadingState());
    final CaptainOrdersApiResponse apiResponse = await repository.captainOrderRequest();
    if (apiResponse.result == true) {
      emit(AllOrderFetchedSuccessfully(apiResponse.orders!));
    } else {
      emit(FailedToFetchedOrders(apiResponse.message ?? "Failed To Fetched Orders!"));
    }
  }
}
