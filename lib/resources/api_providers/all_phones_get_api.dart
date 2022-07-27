import 'package:dio/dio.dart';
import 'package:sim_phone_captain/models/api_response/all_phone_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_phone_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_phone_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_phone_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_phone_api_response.dart';

import '../../models/api_response/all_devices_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AllPhonesGetApi {
  Future<AllPhoneApiResponse> allPhonesRequest() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.allPhones,
      );
      if (response.statusCode == 200) {
        return AllPhoneApiResponse.fromJson(response.data);
      } else {
        return AllPhoneApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AllPhoneApiResponse.fromJson(e.response?.data);
      } else {
        return AllPhoneApiResponse(result: false);
      }
    }
  }
}
