


import 'package:dio/dio.dart';

import '../../models/api_response/sign_up_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class SignUpPostApi {
  Future<SignUpApiResponse> signUpRequest(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.signUp,
        data: _formData,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return SignUpApiResponse.fromJson(response.data);
      } else {
        return SignUpApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return SignUpApiResponse.fromJson(e.response?.data);
      } else {
        return SignUpApiResponse(result: false);
      }
    }
  }
}