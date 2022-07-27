import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/api_response/dashboard_api_response.dart';
import '../../resources/repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  final repository = Repository();

  Future<void> getDashboard() async {
    emit(LoadingState());
    final DashboardApiResponse apiResponse = await repository.getDashboardRequest();
    if (apiResponse.result == true) {
      emit(DashboardFetchedSuccessfully(apiResponse));
    } else {
      emit(const FailedToFetchedDashboard("Failed To Fetched Dashboard!"));
    }
  }
}
