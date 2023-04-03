import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';

class OrderDetailUIModel {
  ProductUIModel products;
  int quantity;
  String branchInCharge;

  OrderDetailUIModel({
    required this.products,
    required this.quantity,
    required this.branchInCharge,
  });

  static final List<OrderDetailUIModel> ordersDetail = [
    OrderDetailUIModel(
      branchInCharge: 'Circle K Nguyễn Thái Bình',
      quantity: 2,
      products: ProductUIModel(
        imageUrl: 'assets/images/product1.png',
        nameVi: 'Thăn ngoại bò Hokubee nhập khẩu từ Nhật Bản ',
        nameEn: 'Hokubee beef tenderloin imported from Japan',
        quantity: 1,
        unitPrice: 285000,
        discount: 30,
        unitPriceAfterDiscount: 270000,
        categoryId: CategoryUIModel.beef.id,
      ),
    ),
    OrderDetailUIModel(
      branchInCharge: 'Circle K Nguyễn Thái Bình',
      quantity: 2,
      products: ProductUIModel(
        nameVi: 'Dưa leo nhật',
        nameEn: 'Japanese cucumber',
        imageUrl: 'assets/images/product11.png',
        unitPrice: 12000,
        discount: 20,
        quantity: 50,
        unitPriceAfterDiscount: 10000,
        categoryId: CategoryUIModel.vegetable.id,
      ),
    ),
    OrderDetailUIModel(
      branchInCharge: 'Circle K Nguyễn Thái Bình',
      quantity: 2,
      products: ProductUIModel(
        nameVi: 'Chanh vàng',
        nameEn: 'Lemon',
        imageUrl: 'assets/images/product7.png',
        unitPrice: 12000,
        discount: 20,
        quantity: 50,
        unitPriceAfterDiscount: 10000,
        categoryId: CategoryUIModel.vegetable.id,
      ),
    ),
    OrderDetailUIModel(
      branchInCharge: 'Circle K Nguyễn Thái Bình',
      quantity: 5,
      products: ProductUIModel(
        nameVi: 'Khoai tây nâu Mỹ',
        nameEn: 'Brown potatoes',
        imageUrl: 'assets/images/product8.png',
        unitPrice: 12000,
        discount: 20,
        quantity: 50,
        unitPriceAfterDiscount: 10000,
        categoryId: CategoryUIModel.vegetable.id,
      ),
    ),
  ];
}
