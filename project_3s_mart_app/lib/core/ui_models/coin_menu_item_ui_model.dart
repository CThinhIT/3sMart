import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:uuid/uuid.dart';

class CoinMenuItemUIModel {
  final String id = const Uuid().v1(); // TODO: remove fake id
  final String nameVi;
  final String nameEn;
  final String imageUrl;

  String get name => AppTranslation.switchViEnString(nameVi, nameEn);

  CoinMenuItemUIModel({
    required this.nameVi,
    required this.nameEn,
    required this.imageUrl,
  });

  static final items = [
    CoinMenuItemUIModel(
      imageUrl: 'assets/images/ic_vcoin_refund.png',
      nameVi: 'X2 hoàn xu Vcoin',
      nameEn: 'X2 Cashback 3Scoin',
    ),
    CoinMenuItemUIModel(
      imageUrl: 'assets/images/ic_get_daily_coins.png',
      nameVi: 'Nhận xu mỗi ngày',
      nameEn: 'Get daily coins',
    ),
    CoinMenuItemUIModel(
      imageUrl: 'assets/images/ic_lucky_draw.png',
      nameVi: 'Vòng quay may mắn',
      nameEn: 'Lucky draw',
    ),
    CoinMenuItemUIModel(
      imageUrl: 'assets/images/ic_leaderboard_gifts.png',
      nameVi: 'Quà xếp hạng',
      nameEn: 'Gifts by tier',
    ),
    CoinMenuItemUIModel(
      imageUrl: 'assets/images/ic_refund_coin_for_orders.png',
      nameVi: 'Hoàn xu đơn hàng',
      nameEn: 'Coin back for orders',
    ),
  ];
}
