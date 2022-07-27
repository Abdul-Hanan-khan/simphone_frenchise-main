import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/dashboard_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class DashboardGetApi {
  Future<DashboardApiResponse> getDashboardRequest() async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.get(
        ApiConstants.dashboard,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return DashboardApiResponse.fromJson(response.data);
      } else {
        return DashboardApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return DashboardApiResponse.fromJson(e.response?.data);
      } else {
        return DashboardApiResponse(result: false);
      }
    }
  }
}
