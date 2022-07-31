
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/models/api_response/add_bulk_sims_response.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_constants/api_constants.dart';

class AddBulkSimsApi{
  Future<AddBulkSimsModal> addBulkSimsRequest(Map _formData, File file) async {
    Uri _uri=Uri.parse(ApiConstants.addBulkSim);
    try {
      http.MultipartRequest request =  http.MultipartRequest("POST", _uri);
      request.fields['simType'] = "prepaid";
      request.fields['numberType'] = "GOLDEN";
      request.fields['series'] = "0309";
      request.fields['network'] = "JazZ";
      request.fields['price'] = "9000";
      request.fields['packageId'] = "628c9fab1afdf6668a0be9c3";

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('simsFile', file.path, );
      request.files.add(multipartFile);
      print(multipartFile);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Accept': '*/*',
        'x-auth-token': '${GetStorage().read('token')}',

      });
      print(GetStorage().read("token"));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        return AddBulkSimsModal.fromJson(jsonDecode(response.body));
      } else {
        return AddBulkSimsModal(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AddBulkSimsModal.fromJson(e.response?.data);
      } else {
        return AddBulkSimsModal(result: false);
      }
    }
  }





   static Future<AddBulkSimsModal?> uploadFileWithMultiPart({File ?file}) async {
    Uri _uri=Uri.parse(ApiConstants.addBulkSim);
    try {
      http.MultipartRequest request =  http.MultipartRequest("POST", _uri);
      request.fields['simType'] = "prepaid";
      request.fields['numberType'] = "GOLDEN";
      request.fields['series'] = "0309";
      request.fields['network'] = "JazZ";
      request.fields['price'] = "9000";
      request.fields['packageId'] = "628c9fab1afdf6668a0be9c3";

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('simsFile', file!.path, );
      request.files.add(multipartFile);
      print(multipartFile);
      request.headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Accept': '*/*',
          'x-auth-token': '${GetStorage().read('token')}',

      });
      print(GetStorage().read("token"));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200 ) {
        return jsonDecode(response.body);
      }
    }
    catch (e) {
      return null;
    }
  }
}