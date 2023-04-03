import 'package:hive/hive.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/base_entity.dart';

part 'delivery_address_entity.g.dart';

@HiveType(typeId: 2)
class DeliveryAddressEntity extends BaseEntity {
  @HiveField(1)
  String fullName;
  @HiveField(2)
  bool isDefaultAddress;
  @HiveField(3)
  String phoneNumber;
  @HiveField(4)
  String province;
  @HiveField(5)
  String district;
  @HiveField(6)
  String ward;
  @HiveField(7)
  String address;
  DeliveryAddressEntity({
    String? id,
    this.fullName = '',
    this.isDefaultAddress = false,
    this.phoneNumber = '',
    this.province = '',
    this.address = '',
    this.ward = '',
    this.district = '',
  }) : super(id: id);
}
