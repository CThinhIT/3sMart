import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';

abstract class IDeliveryAddressService {
  List<DeliveryAddressEntity> getAllDeliveryAddress();
  DeliveryAddressEntity? findByDeliveryAddressId(String id);
  Future<void> insertDeliveryAddress(
    DeliveryAddressEntity deliveryAddressEntity,
  );
  Future<void> updateDeliveryAddress(
    DeliveryAddressEntity deliveryAddressEntity,
  );
  Future<void> deleteDeliveryAddress(
    String id,
  );
}
