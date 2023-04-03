import 'package:uuid/uuid.dart';

class CouponUIModel {
  final id = const Uuid().v1(); // TODO: remove fake id
  final String imageUrl;
  final String title;
  final DateTime expiredDate;

  CouponUIModel({
    required this.imageUrl,
    required this.title,
    required this.expiredDate,
  });

  static final fakeList = [
    CouponUIModel(
      imageUrl: 'assets/images/tmp_coupon1.png',
      title: 'Giảm 40% tối đa 35K cho đơn hàng từ 120K',
      expiredDate: DateTime.now()..add(const Duration(days: 1)),
    ),
    CouponUIModel(
      imageUrl: 'assets/images/tmp_coupon2.png',
      title: 'Giảm 30% tối đa 55K cho đơn hàng từ 220K',
      expiredDate: DateTime.now()..add(const Duration(days: 2)),
    ),
    CouponUIModel(
      imageUrl: 'assets/images/tmp_coupon3.png',
      title: 'Giảm 30% tối đa 55K cho đơn hàng từ 220K',
      expiredDate: DateTime.now()..add(const Duration(days: 3)),
    ),
  ];
}
