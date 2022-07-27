
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/utils/api_constants/api_constants.dart';

import '../../models/api_response/order_update_api_response.dart';

class OrderUpdatePutApi{

  Future<OrderUpdateApiResponse> updateOrderRequest(Map _formData,String id) async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.put(
        ApiConstants.updateOrder + id,
        data: _formData,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return OrderUpdateApiResponse.fromJson(response.data);
      } else {
        return OrderUpdateApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return OrderUpdateApiResponse.fromJson(e.response?.data);
      } else {
        return OrderUpdateApiResponse(result: false);
      }
    }
  }

}
