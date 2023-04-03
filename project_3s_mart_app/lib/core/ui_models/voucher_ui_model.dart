import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:uuid/uuid.dart';

class VoucherUIModel {
  final String id = const Uuid().v4(); // TODO: remove fake id
  final String code;
  final String nameVi;
  final String nameEn;
  final String brand;
  final String detail;
  final double unitPrice;
  final String imageUrl;
  final int quantity;
  final double unitPriceAfterDiscount;
  final DateTime date;
  final List<BranchUIModel> stores;

  String get name => AppTranslation.switchViEnString(nameVi, nameEn);

  VoucherUIModel({
    required this.code,
    required this.nameVi,
    this.nameEn = 'Name En',
    required this.brand,
    required this.detail,
    required this.imageUrl,
    required this.unitPrice,
    required this.quantity,
    required this.unitPriceAfterDiscount,
    required this.date,
    required this.stores,
  });

  static final fakeList = [
    VoucherUIModel(
      code: 'Chinsu1',
      brand: 'Chinsu',
      nameVi: 'Bộ sản phẩm serum Bicos',
      nameEn: 'Bicos serum product set',
      unitPrice: 160000,
      imageUrl: 'assets/images/tmp_coin_voucher2.png',
      detail: '',
      quantity: 1,
      unitPriceAfterDiscount: 120000,
      date: DateTime.now(),
      stores: BranchUIModel.applicablePromoStoreList,
    ),
    VoucherUIModel(
      code: 'Meatdeli2',
      brand: 'Meatdeli',
      nameVi: 'Combo heo nướng',
      nameEn: 'Grilled pork combo',
      unitPrice: 160000,
      imageUrl: 'assets/images/tmp_coin_voucher.png',
      detail: '',
      quantity: 1,
      unitPriceAfterDiscount: 120000,
      date: DateTime.now(),
      stores: BranchUIModel.applicablePromoStoreList,
    ),
    VoucherUIModel(
      code: 'Meatdeli1',
      brand: 'Meatdeli',
      nameVi: 'Bộ nồi inox chống dính GE30',
      nameEn: 'GE30 non-stick stainless steel pot set',
      unitPrice: 160000,
      imageUrl: 'assets/images/tmp_coin_voucher.png',
      detail: '',
      quantity: 1,
      unitPriceAfterDiscount: 120000,
      date: DateTime.now(),
      stores: BranchUIModel.applicablePromoStoreList,
    ),
  ];
}
