

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/add_new_captain_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AddNewCaptainPostApi{

  Future<AddNewCaptainApiResponse> addNewCaptainRequest(Map _formData) async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.post(
        ApiConstants.addNewCaptain,
        data: _formData,

      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return AddNewCaptainApiResponse.fromJson(response.data);
      } else {
        return AddNewCaptainApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AddNewCaptainApiResponse.fromJson(e.response?.data);
      } else {
        return AddNewCaptainApiResponse(result: false);
      }
    }
  }

}