import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/api_response/sign_up_api_response.dart';
import '../../../resources/repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final _repository = Repository();

  Future signUp({
    required String franchiseName,
    required String phoneNo,
    required String password,
    required String address,
    required String email,
    required String lat,
    required String long,
    XFile ?avatarImage
  }) async {
    emit(LoadingState());
    Map data = {
      "name": franchiseName,
      "email": email,
      "phone": phoneNo,
      "password": password.toString(),
      "address": address,
      "lat":lat,
      "long":long,
    };
    print(data);
    final SignUpApiResponse signUpModel = await _repository.signUp(name: franchiseName,email: email,phone: phoneNo,password: password,address: address,lat: lat,long: long,avatarFile: avatarImage);
    if (signUpModel.result == true) {
      emit(const SignUpSuccessful("Sign Up Successfully"));
    } else {
      emit(const SignUpFailed("Sign Up Failed"));
    }
  }
}
