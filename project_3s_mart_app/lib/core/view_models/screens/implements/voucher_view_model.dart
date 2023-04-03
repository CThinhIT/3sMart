import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ivoucher_view_model.dart';

class VoucherViewModel extends ChangeNotifier implements IVoucherViewModel {
  List<BranchUIModel> _allStores = [];
  @override
  List<BranchUIModel> get allStores => _allStores;

  List<BranchUIModel> _nearbyStores = [];
  @override
  List<BranchUIModel> get nearbyStores => _nearbyStores;

  List<BranchUIModel> _otherStores = [];
  @override
  List<BranchUIModel> get otherStores => _otherStores;

  @override
  Future<void> initStoreList(List<BranchUIModel> stores) async {
    List<BranchUIModel> _nearbyStoreList = [];
    List<BranchUIModel> _otherStoreList = [];
    for (int i = 0; i < stores.length; i++) {
      if (stores[i].distance < 5) {
        _nearbyStoreList.add(stores[i]);
      } else {
        _otherStoreList.add(stores[i]);
      }
    }
    _allStores = stores;
    _nearbyStores = _nearbyStoreList;
    _otherStores = _otherStoreList;
    notifyListeners();
  }

  @override
  List<VoucherUIModel> get myVouchers => [
        VoucherUIModel(
          code: 'Chinsu1',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
        VoucherUIModel(
          code: 'Chinsu10',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
        VoucherUIModel(
          code: 'Chinsu11',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
      ];

  /////

  @override
  List<VoucherUIModel> get hotVouchers => [
        VoucherUIModel(
          code: 'Chinsu2',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
        VoucherUIModel(
          code: 'Chinsu3',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
        VoucherUIModel(
          code: 'Chinsu4',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
        VoucherUIModel(
          code: 'Chinsu5',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
        VoucherUIModel(
          code: 'Chinsu6',
          brand: 'Chinsu',
          nameVi: 'Set 2 chai Tương ớt Chin-Su Cay gấp đôi chỉ 18,000đ',
          nameEn:
              'Set of 2 bottles of Chin-Su Chili Sauce "Double Spicy" only VND 18,000',
          unitPrice: 160000,
          imageUrl: '',
          detail:
              'Combo set 2 chai tương ớt Chin-Su chỉ 18,000đ (giá gốc 48,000đ) \n \nCombo gồm: \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml \n • 1 chai nước mắm Chinsu cá hồi 500ml \n • 1 chai tương ớt Chinsu 250ml\n • 1 chai nước tương Chinsu 250ml \n • 2 hộp hạt nêm Chinsu 170gr \n • 2 chai tương ớt siêu cay Chinsu 250gr',
          quantity: 1,
          unitPriceAfterDiscount: 120000,
          date: DateTime.now(),
          stores: BranchUIModel.applicablePromoStoreList,
        ),
      ];
}
