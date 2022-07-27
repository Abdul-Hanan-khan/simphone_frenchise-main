import 'package:dio/dio.dart';

import '../../models/api_response/all_devices_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AllDevicesGetApi {
  Future<AllDevicesApiResponse> allDevicesRequest() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.allWifiDevices,
      );
      if (response.statusCode == 200) {
        return AllDevicesApiResponse.fromJson(response.data);
      } else {
        return AllDevicesApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AllDevicesApiResponse.fromJson(e.response?.data);
      } else {
        return AllDevicesApiResponse(result: false);
      }
    }
  }
}
