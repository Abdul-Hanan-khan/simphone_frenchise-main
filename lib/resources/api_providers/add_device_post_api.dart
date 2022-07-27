import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/add_device_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AddDevicePostApi {
  Future<AddDeviceApiResponse> addNewDeviceRequest(Map _formData) async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.put(
        ApiConstants.addDevice,
        data: _formData,
      );
      if (response.statusCode == 200) {
        return AddDeviceApiResponse.fromJson(response.data);
      } else {
        return AddDeviceApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AddDeviceApiResponse.fromJson(e.response?.data);
      } else {
        return AddDeviceApiResponse(result: false);
      }
    }
  }
}
