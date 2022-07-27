import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sim_phone_captain/models/api_response/delete_sim_api_response.dart';

import '../../models/api_response/all_sim_api_response.dart';
import '../../resources/repository.dart';

part 'all_sims_state.dart';

class AllSimsCubit extends Cubit<AllSimsState> {
  AllSimsCubit() : super(AllSimsInitial());

  final repository = Repository();

  Future<void> allSims() async {
    emit(LoadingState());
    final AllSimApiResponse apiResponse = await repository.allSim();
    if (apiResponse.result == true) {
      emit(AllSimsFetchedSuccessfully(apiResponse.sims!));
    } else {
      emit(FailedToFetchedSims(apiResponse.message ?? "Failed To Fetched Sims!"));
    }
  }

  Future<void> deleteSims({required String id}) async {
    emit(LoadingState());
    final DeleteSimApiResponse apiResponse = await repository.simDelete(id);
    if (apiResponse.result == true) {
      emit(DeleteSimSuccessfully(apiResponse.message ?? "Delete Sim Successfully"));
    } else {
      emit(FailedToFetchedSims(apiResponse.message ?? "Failed To Delete Sim!"));
    }
  }

}
