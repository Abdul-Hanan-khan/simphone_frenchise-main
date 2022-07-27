import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/captain_orders_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class CaptainOrdersGetApi {
  Future<CaptainOrdersApiResponse> captainOrdersRequest() async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.get(
        ApiConstants.captainOrder,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return CaptainOrdersApiResponse.fromJson(response.data);
      } else {
        return CaptainOrdersApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return CaptainOrdersApiResponse.fromJson(e.response?.data);
      } else {
        return CaptainOrdersApiResponse(result: false);
      }
    }
  }
}
