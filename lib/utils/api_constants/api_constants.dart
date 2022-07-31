class ApiConstants {
  ApiConstants._();

  // static const String baseUrl = "https://simphoneserver.herokuapp.com";
  static const String baseUrl = "https://simphoneserver.alliancetechltd.com";
  static const String signUp = "$baseUrl/api/franchises";
  static const String login = "$baseUrl/api/auth/franchiseLogin";
  static const String addNewSim = "$baseUrl/api/sims";
  static const String addBulkSim = "$baseUrl/api/sims/bulk";
  static const String allSims = "$baseUrl/api/sims/franchise/mine";
  static const String allWifiDevices = "$baseUrl/api/wifidevices";
  static const String allPhones = "$baseUrl/api/mobiles";
  static const String addDevice = "$baseUrl/api/franchises/addDevice";
  static const String captainMobile = "$baseUrl/api/franchises/mobiles";
  static const String captainDevices = "$baseUrl/api/franchises/wifidevices";
  static const String simpleSimPackage = "$baseUrl/api/packages/simple";
  static const String dataSimPackage = "$baseUrl/api/packages/data";
  static const String deleteSims = "$baseUrl/api/sims/";
  static const String captainOrder = "$baseUrl/api/orders/franchise";
  static const String editSim = "$baseUrl/api/sims/";
  static const String updateOrder = "$baseUrl/api/orders/status/";
  static const String getUser = "$baseUrl/api/franchises/self";
  static const String dashboard = "$baseUrl/api/orders/stats";
  static const String updateUser = "$baseUrl/api/users/chnageUser";
  static const String addNewCaptain = "$baseUrl/api/users/captain";
  static const String allCaptain = "$baseUrl/api/franchises/captainsActive";
}
