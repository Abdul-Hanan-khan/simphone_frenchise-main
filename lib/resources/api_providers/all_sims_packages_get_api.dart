import 'package:dio/dio.dart';
import 'package:sim_phone_captain/models/api_response/data_sim_packages_api_response.dart';

import '../../models/api_response/sim_packages_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class AllPackagesGetApi {
  Future<SimPackagesApiResponse> allPackagesRequest() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.simpleSimPackage,
      );
      if (response.statusCode == 200) {
        return SimPackagesApiResponse.fromJson(response.data);
      } else {
        return SimPackagesApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return SimPackagesApiResponse.fromJson(e.response?.data);
      } else {
        return SimPackagesApiResponse(result: false);
      }
    }
  }
  Future<DataSimPackagesApiResponse> allDataPackagesRequest() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.dataSimPackage,
      );
      if (response.statusCode == 200) {
        return DataSimPackagesApiResponse.fromJson(response.data);
      } else {
        return DataSimPackagesApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return DataSimPackagesApiResponse.fromJson(e.response?.data);
      } else {
        return DataSimPackagesApiResponse(result: false);
      }
    }
  }
}
