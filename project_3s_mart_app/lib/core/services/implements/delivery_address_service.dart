import 'package:project_3s_mart_app/core/hive_database/daos/delivery_address_dao.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';
import 'package:project_3s_mart_app/core/services/interfaces/idelivery_address_service.dart';
import 'package:project_3s_mart_app/global/locator.dart';

class DeliveryAddressService extends IDeliveryAddressService {
  final _dao = locator<DeliveryAddressDao>();
  @override
  List<DeliveryAddressEntity> getAllDeliveryAddress() {
    return _dao.getAll();
  }

  @override
  Future<void> insertDeliveryAddress(
      DeliveryAddressEntity deliveryAddressEntity) async {
    await _dao.insert(deliveryAddressEntity);
  }

  @override
  DeliveryAddressEntity? findByDeliveryAddressId(String id) {
    return _dao.findById(id);
  }

  @override
  Future<void> updateDeliveryAddress(
      DeliveryAddressEntity deliveryAddressEntity) async {
    return await _dao.update(deliveryAddressEntity.id, deliveryAddressEntity);
  }

  @override
  Future<void> deleteDeliveryAddress(String id) async {
    return await _dao.delete(id);
  }
}
