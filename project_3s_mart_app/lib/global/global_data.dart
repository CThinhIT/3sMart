class GlobalData {
  GlobalData() {
    deviceInfo = DeviceInfo();
  }

  DeviceInfo deviceInfo = DeviceInfo();
  AccountInfo accountInfo = AccountInfo();
  AccountInfo newAccount = AccountInfo();
  late String logLevel;
}

// TODO: remove fake data
class DeviceInfo {
  late String deviceSerial;
  late String id;
  late String deviceId;
  late String branchId;
  String branchName = 'BigC';
  late bool isTraining;
  late bool saleDiscount;
  String userName = 'Thế Lữ';
  late String branchCode;
}

class AccountInfo {
  late String userName = 'Thế Lữ';
  late String phoneNumber = '0782454274';
}
