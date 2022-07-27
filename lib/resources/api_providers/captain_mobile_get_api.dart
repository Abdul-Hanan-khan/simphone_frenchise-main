
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/captain_mobile_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class CaptainMobileGetApi{

  Future<CaptainMobileApiResponse> captainPhonesRequest() async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.get(
        ApiConstants.captainMobile,
      );
      if (response.statusCode == 200) {
        return CaptainMobileApiResponse.fromJson(response.data);
      } else {
        return CaptainMobileApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return CaptainMobileApiResponse.fromJson(e.response?.data);
      } else {
        return CaptainMobileApiResponse(result: false);
      }
    }
  }

}