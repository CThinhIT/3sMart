import 'package:uuid/uuid.dart';

class CoinRedeemingCategoryUIModel {
  final String id = const Uuid().v1(); // TODO: remove fake id
  final String name;
  final String imageUrl;

  CoinRedeemingCategoryUIModel({required this.name, required this.imageUrl});

  static final fakeList = [
    CoinRedeemingCategoryUIModel(imageUrl: 'assets/images/tmp_coin_redeeming_category_all.png', name: 'Tất cả'),
    CoinRedeemingCategoryUIModel(imageUrl: 'assets/images/tmp_coin_redeeming_category_food.png', name: 'Thực phẩm các loại'),
    CoinRedeemingCategoryUIModel(imageUrl: 'assets/images/tmp_coin_redeeming_category_food.png', name: 'Đồ dùng gia đình'),
    CoinRedeemingCategoryUIModel(imageUrl: 'assets/images/tmp_coin_redeeming_category_food.png', name: 'Chăm sóc cá nhân'),
    CoinRedeemingCategoryUIModel(imageUrl: 'assets/images/tmp_coin_redeeming_category_food.png', name: 'Khác'),
  ];
}
