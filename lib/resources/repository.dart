import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sim_phone_captain/models/api_response/add_device_api_response.dart';
import 'package:sim_phone_captain/models/api_response/add_new_sim_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_devices_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_phone_api_response.dart';
import 'package:sim_phone_captain/models/api_response/all_sim_api_response.dart';
import 'package:sim_phone_captain/models/api_response/captain_mobile_api_response.dart';
import 'package:sim_phone_captain/models/api_response/captain_orders_api_response.dart';
import 'package:sim_phone_captain/models/api_response/data_sim_packages_api_response.dart';
import 'package:sim_phone_captain/models/api_response/edit_sim_api_response.dart';
import 'package:sim_phone_captain/models/api_response/sign_in_api_response.dart';
import 'package:sim_phone_captain/models/api_response/sign_up_api_response.dart';
import 'package:sim_phone_captain/models/api_response/sim_packages_api_response.dart';
import 'package:sim_phone_captain/resources/api_providers/add_bulk_sims_api.dart';
import 'package:sim_phone_captain/resources/api_providers/add_device_post_api.dart';
import 'package:sim_phone_captain/resources/api_providers/add_new_captain_post_api.dart';
import 'package:sim_phone_captain/resources/api_providers/add_new_sim_post_api.dart';
import 'package:sim_phone_captain/resources/api_providers/all_devices_get_api.dart';
import 'package:sim_phone_captain/resources/api_providers/all_phones_get_api.dart';
import 'package:sim_phone_captain/resources/api_providers/captain_mobile_get_api.dart';
import 'package:sim_phone_captain/resources/api_providers/captain_orders_get_api.dart';
import 'package:sim_phone_captain/resources/api_providers/sim_delete_api.dart';
import 'package:sim_phone_captain/resources/api_providers/user_get_api.dart';

import '../models/api_response/add_bulk_sims_response.dart';
import '../models/api_response/add_new_captain_api_response.dart';
import '../models/api_response/all_captain_api_response.dart';
import '../models/api_response/dashboard_api_response.dart';
import '../models/api_response/delete_sim_api_response.dart';
import '../models/api_response/get_user_api_response.dart';
import '../models/api_response/order_update_api_response.dart';
import '../models/api_response/update_user_api_response.dart';
import 'api_providers/all_captain_get_api.dart';
import 'api_providers/all_sims_get_api.dart';
import 'api_providers/all_sims_packages_get_api.dart';
import 'api_providers/captain_devices_get_api.dart';
import 'api_providers/dashboard_get_api.dart';
import 'api_providers/order_update_put_api.dart';
import 'api_providers/sign_in_post_api.dart';
import 'api_providers/sign_up_post_api.dart';
import 'api_providers/update_user_put_api.dart';

class Repository {
  Future<SignUpApiResponse> signUp(Map data) {
    final signUpPost = SignUpPostApi();
    return signUpPost.signUpRequest(data);
  }

  Future<SignInApiResponse> signIn(Map data) {
    final signUpPost = SignInPostApi();
    return signUpPost.signInRequest(data);
  }

  Future<AddNewSimApiResponse> addSim(Map data) async {
    return AddNewSimPostApi().addNewSimRequest(data);
  }
  Future<AddBulkSimsModal> addBulkSims(Map data, File file) async {
    return AddBulkSimsApi().addBulkSimsRequest(data,file);
  }

  Future<AllSimApiResponse> allSim() async {
    return AllSimsGetApi().allSimsRequest();
  }

  Future<AllDevicesApiResponse> allDevices() async {
    return AllDevicesGetApi().allDevicesRequest();
  }

  Future<AllPhoneApiResponse> allPhone() async {
    return AllPhonesGetApi().allPhonesRequest();
  }

  Future<AddDeviceApiResponse> addDevice(Map data) async {
    return AddDevicePostApi().addNewDeviceRequest(data);
  }

  Future<CaptainMobileApiResponse> captainMobile() async {
    return CaptainMobileGetApi().captainPhonesRequest();
  }

  Future<CaptainMobileApiResponse> captainDevice() async {
    return CaptainDevicesGetApi().captainDevicesRequest();
  }

  Future<SimPackagesApiResponse> allPackagesRequest() async {
    return AllPackagesGetApi().allPackagesRequest();
  }
  Future<DataSimPackagesApiResponse> allDataPackagesRequest() async {
    return AllPackagesGetApi().allDataPackagesRequest();
  }

  Future<DeleteSimApiResponse> simDelete(id) async {
    return SimDeleteApi().simDeleteRequest(id);
  }

  Future<CaptainOrdersApiResponse> captainOrderRequest() async {
    return CaptainOrdersGetApi().captainOrdersRequest();
  }

  Future<EditSimApiResponse> editSimRequest(Map data, String id) async {
    return AddNewSimPostApi().editSimRequest(data, id);
  }

  Future<OrderUpdateApiResponse> orderUpdateRequest(Map data, String id) async {
    return OrderUpdatePutApi().updateOrderRequest(data, id);
  }

  Future<GetUserApiResponse> getUserRequest() async {
    return UserGetApi().getUserRequest();
  }


  Future<DashboardApiResponse> getDashboardRequest() async {
    return DashboardGetApi().getDashboardRequest();
  }

  Future<UpdateUserApiResponse> updateUser(FormData data) async {
    return UpdateUserPutApi().updateUserRequest(data);
  }

  Future<AddNewCaptainApiResponse> addNewCaptain(Map data) async {
    return AddNewCaptainPostApi().addNewCaptainRequest(data);
  }

  Future<AllCaptainApiResponse> allCaptainRequest() async {
    return AllCaptainGetApi().allCaptainRequest();
  }
}
