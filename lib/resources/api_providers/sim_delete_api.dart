import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/api_response/delete_sim_api_response.dart';
import '../../utils/api_constants/api_constants.dart';

class SimDeleteApi {
  Future<DeleteSimApiResponse> simDeleteRequest(id) async {
    try {
      final Dio dio = Dio();
      dio.options.headers["x-auth-token"] = GetStorage().read('token');
      final Response response = await dio.delete(
        ApiConstants.deleteSims + id.toString(),
      );
      if (response.statusCode == 200) {
        return DeleteSimApiResponse.fromJson(response.data);
      } else {
        return DeleteSimApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return DeleteSimApiResponse.fromJson(e.response?.data);
      } else {
        return DeleteSimApiResponse(result: false);
      }
    }
  }
}
