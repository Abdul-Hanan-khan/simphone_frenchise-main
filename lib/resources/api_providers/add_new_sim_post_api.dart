
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/add_new_sim_api_response.dart';
import '../../models/api_response/edit_sim_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AddNewSimPostApi{

  Future<AddNewSimApiResponse> addNewSimRequest(Map _formData) async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.post(
        ApiConstants.addNewSim,
        data: _formData,

      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return AddNewSimApiResponse.fromJson(response.data);
      } else {
        return AddNewSimApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AddNewSimApiResponse.fromJson(e.response?.data);
      } else {
        return AddNewSimApiResponse(result: false);
      }
    }
  }
  Future<EditSimApiResponse> editSimRequest(Map _formData,String id) async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.put(
        ApiConstants.editSim + id,
        data: _formData,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return EditSimApiResponse.fromJson(response.data);
      } else {
        return EditSimApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return EditSimApiResponse.fromJson(e.response?.data);
      } else {
        return EditSimApiResponse(result: false);
      }
    }
  }

}