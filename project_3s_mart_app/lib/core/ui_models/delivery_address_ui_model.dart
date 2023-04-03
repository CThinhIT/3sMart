import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';

class DeliveryAddressUIModel {
  String id;
  String fullName;
  bool isDefaultAddress;
  String phoneNumber;
  String province;
  String address;
  String ward;
  String district;

  DeliveryAddressUIModel({
    this.id = '',
    this.fullName = '',
    this.isDefaultAddress = false,
    this.phoneNumber = '',
    this.province = '',
    this.address = '',
    this.ward = '',
    this.district = '',
  });

  factory DeliveryAddressUIModel.fromEntities(DeliveryAddressEntity entity) {
    return DeliveryAddressUIModel(
      id: entity.id,
      fullName: entity.fullName,
      address: entity.address,
      province: entity.province,
      district: entity.district,
      ward: entity.ward,
      phoneNumber: entity.phoneNumber,
      isDefaultAddress: entity.isDefaultAddress,
    );
  }
}
