

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/all_captain_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AllCaptainGetApi{

  Future<AllCaptainApiResponse> allCaptainRequest() async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.get(
        ApiConstants.allCaptain,
      );
      if (response.statusCode == 200) {
        return AllCaptainApiResponse.fromJson(response.data);
      } else {
        return AllCaptainApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AllCaptainApiResponse.fromJson(e.response?.data);
      } else {
        return AllCaptainApiResponse(result: false);
      }
    }
  }
}