part of '../exchange_coin_screen.dart';

class _ExchangeCoinBannerList extends StatelessWidget {
  const _ExchangeCoinBannerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      children: [
        _ExchangeCoinBannerItem(
          imageUrl: 'assets/images/banner_exchange_coin_3s_coin_exchange.png',
          buttonTitle: Strings.exchangeCoins.tr,
          onImagePressed: () {},
          onButtonPressed: () {},
        ),
        SizedBox(height: 16.h),
        _ExchangeCoinBannerItem(
          imageUrl: 'assets/images/banner_exchange_coin_vpbank_linking.png',
          onImagePressed: () {},
        ),
        SizedBox(height: 16.h),
        _ExchangeCoinBannerItem(
          imageUrl: 'assets/images/banner_exchange_coin_get_money.png',
          onImagePressed: () {},
        ),
      ],
    );
  }
}
