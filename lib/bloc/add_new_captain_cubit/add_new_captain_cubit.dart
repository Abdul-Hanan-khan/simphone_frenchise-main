import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/api_response/add_new_captain_api_response.dart';
import '../../resources/repository.dart';

part 'add_new_captain_state.dart';

class AddNewCaptainCubit extends Cubit<AddNewCaptainState> {
  AddNewCaptainCubit() : super(AddNewCaptainInitial());

  final repository = Repository();


  Future<void> addNewCaptain(
      {required String name,
        required String cnic,
        required String email,
        required String phone,
        required String address,
        required String password
      }) async {
    emit(LoadingState());
    var _formData = {
      'name': name,
      'cnic': cnic,
      'email': email,
      'phone': phone,
      'address': address,
      'password': password,
    };
    print(_formData);
    final AddNewCaptainApiResponse apiResponse = await repository.addNewCaptain(_formData);
    if (apiResponse.result == true) {
      emit(AddCaptainSuccessfully(apiResponse.message ?? "Add New Captain Successfully"));
    } else {
      emit(FailedToAddCaptain(apiResponse.message ?? "Failed To Add New Captain!"));
    }
  }

}
