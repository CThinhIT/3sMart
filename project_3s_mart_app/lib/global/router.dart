import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/order_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/global/environment.dart';
import 'package:project_3s_mart_app/ui/screens/3s_coin_screen/coin_screen.dart';
import 'package:project_3s_mart_app/ui/screens/3s_coin_screen/exchange_coin_screen/exchange_coin_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/account_gift_screen/account_gift_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/account_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/account_setting_screen/account_setting_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/add_delivery_address_screen/add_delivery_address_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/add_delivery_address_screen/select_address_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/edit_myaddress_screen/edit_myaddress_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/invite_friends_screen/invite_friends_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/my_addresses_screen/my_addresses_screen.dart';
import 'package:project_3s_mart_app/ui/screens/add_creditcard_screen/add_creditcard_screen.dart';
import 'package:project_3s_mart_app/ui/screens/add_payment_method_screen/add_payment_method_screen.dart';
import 'package:project_3s_mart_app/ui/screens/basket_screen/basket_screen.dart';
import 'package:project_3s_mart_app/ui/screens/carousel_slider_screen/carousel_slider_screen.dart';
import 'package:project_3s_mart_app/ui/screens/category_screen/category_screen.dart';
import 'package:project_3s_mart_app/ui/screens/coupon_screen/coupon_screen.dart';
import 'package:project_3s_mart_app/ui/screens/direct_payment_method_screen/direct_payment_method_screen.dart';
import 'package:project_3s_mart_app/ui/screens/direct_payment_method_screen/online_payment_screen/online_payment_screen.dart';
import 'package:project_3s_mart_app/ui/screens/fingerprint_login_screen/fingerprint_login_screen.dart';
import 'package:project_3s_mart_app/ui/screens/home_screen/home_screen.dart';
import 'package:project_3s_mart_app/ui/screens/login_screen/login_screen.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step1_screen/order_info_step1_screen.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step2_screen/order_info_step2_screen.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step3_screen/order_info_step3_screen.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step4_screen/order_info_step4_screen.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/order_detail_screen/order_detail_screen.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/orders_management_screen.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/track_your_order/track_your_order_screen.dart';
import 'package:project_3s_mart_app/ui/screens/otp_screen/otp_screen.dart';
import 'package:project_3s_mart_app/ui/screens/payment_setting_screen/payment_setting_screen.dart';
import 'package:project_3s_mart_app/ui/screens/product_category_screen/product_category_screen.dart';
import 'package:project_3s_mart_app/ui/screens/product_detail_screen/product_detail_screen.dart';
import 'package:project_3s_mart_app/ui/screens/register_screen/register_screen.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_and_go_barcode_screen/scan_and_go_barcode_screen.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_and_go_cart/scan_and_go_cart_screen.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_and_go_delivery_method/scan_and_go_delivery_method.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_and_go_introduction_screen/scan_and_go_introduction_screen.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_and_go_order_confirm/scan_and_go_order_confirm_screen.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_screen/scan_screen.dart';
import 'package:project_3s_mart_app/ui/screens/search_product_srceen/search_product_srceen.dart';
import 'package:project_3s_mart_app/ui/screens/select_a_branch_group_screen/select_a_branch_group_screen.dart';
import 'package:project_3s_mart_app/ui/screens/select_branch_to_shop_screen/select_branch_to_shop_screen.dart';
import 'package:project_3s_mart_app/ui/screens/select_purchase_method_screen/select_purchase_method_screen.dart';
import 'package:project_3s_mart_app/ui/screens/setting_quick_login_screen/setting_quick_login_screen.dart';
import 'package:project_3s_mart_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:project_3s_mart_app/ui/screens/user_login_screen/user_login_screen.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/applicable_store/applicable_stores_screen.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/buy_voucher_detail.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/voucher_barcode_screen.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/voucher_payment_screen.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/voucher_wallet_screen.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/your_voucher_detail_screen.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';
  static const String selectABranchGroup = 'selectABranchGroup';
  static const String otp = '/otp';
  static const String userLogin = '/userLogin';
  static const String carouselSlider = '/carouselSlider';
  static const String selectPurchaseMethod = '/selectPurchaseMethod';
  static const String orderInfoStep1 = '/orderInfoStep1';
  static const String orderInfoStep3 = '/orderInfoStep3';
  static const String orderInfoStep4 = '/orderInfoStep4';
  static const String selectBranchToShop = '/selectBranchToShop';
  static const String category = '/category';
  static const String home = '/home';
  static const String voucherWallet = '/voucherWallet';
  static const String productCategory = '/productCategory';
  static const String account = '/account';
  static const String confirmOder = '/confirmOder';
  static const String quickLogin = '/quickLogin';
  static const String orderInfoStep2 = '/orderInfoStep2';
  static const String ordersManagement = '/ordersManagement';
  static const String orderDetail = '/orderDetail';
  static const String basket = '/basket';
  static const String accountSetting = '/accountSetting';
  static const String trackYourOrder = '/trackYourOrder';
  static const String myAddresses = '/myAddresses';
  static const String coin = '/coin';
  static const String exchangeCoin = '/exchangeCoin';
  static const String scanAndGoIntroduction = '/scanAndGoIntroduction';
  static const String scanAndGoPayMethod = '/scanAndGoPayMethod';
  static const String scanAndGoToCart = '/scanAndGoToCart';
  static const String scanAndGoDeliveryMethod = '/scanAndGoDeliveryMethod';
  static const String voucherPayment = '/voucherPayment';
  static const String finerPrintLogin = '/finerPrintLogin';
  static const String directPaymentMethod = '/directPaymentMethod';
  static const String onlinePayment = '/onlinePayment';
  static const String inviteFriend = '/inviteFriend';
  static const String scan = '/scan';
  static const String voucherBarCode = '/voucherBarCode';
  static const String accountGift = '/accountGift';
  static const String scanAndGoBarCode = '/scanAndGoBarCode';
  static const String productDetail = '/productDetail';
  static const String editMyAddress = '/editMyAddress';
  static const String addNewDeliveryAddress = '/addNewDeliveryAddress';
  static const String choosenAddress = '/choosenAddress';
  static const String voucherDetail = '/voucherDetail';
  static const String paymentSetting = '/paymentSetting';
  static const String addPaymentInformation = '/addPaymentInformation';
  static const String addCreditCard = '/addCreditCard';
  static const String scanAndGoOrderConfirm = '/scanAndGoOrderConfirm';
  static const String coupon = '/coupon';
  static const String applicableStores = '/applicableStores';
  static const String searchProduct = '/searchProduct';
  static const String yourVoucherDetail = '/yourVoucherDetail';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static PageRouteBuilder _buildRouteNavigation(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRouteNavigationWithoutEffect(
          settings,
          SplashScreen(),
        );
      case register:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const RegisterScreen(),
        );
      case userLogin:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const UserLoginScreen(),
        );
      case otp:
        return _buildRouteNavigationWithoutEffect(
          settings,
          OTPScreen(
            arguments: settings.arguments as OTPScreenArguments,
          ),
        );
      case carouselSlider:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const CarouselSliderScreen(),
        );
      case login:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const LoginScreen(),
        );
      case selectABranchGroup:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SelectABranchGroupScreen(),
        );
      case selectPurchaseMethod:
        return _buildRouteNavigationWithoutEffect(
          settings,
          SelectPurchaseMethodScreen(),
        );
      case orderInfoStep1:
        return _buildRouteNavigationWithoutEffect(
          settings,
          OrderInfoStep1Screen(
            purchaseMethod: settings.arguments as PurchaseMethod,
          ),
        );
      case selectBranchToShop:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SelectBranchToShopScreen(),
        );
      case category:
        return _buildRouteNavigationWithoutEffect(
          settings,
          CategoryScreen(),
        );
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );
      case voucherWallet:
        return _buildRouteNavigationWithoutEffect(
          settings,
          VoucherWalletScreen(
            page: (settings.arguments ?? 0) as int,
          ),
        );
      case productCategory:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ProductCategoryScreen(
            filter: settings.arguments != null
                ? settings.arguments as ProductFilterArguments
                : null,
          ),
        );
      case orderInfoStep3:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OrderInfoStep3Screen(),
        );
      case orderInfoStep4:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OrderInfoStep4(),
        );
      case account:
        return _buildRouteNavigationWithoutEffect(
          settings,
          AccountScreen(
            isOnlineShopping: (settings.arguments ?? true) as bool,
          ),
        );
      case orderInfoStep2:
        return _buildRouteNavigationWithoutEffect(
          settings,
          OrderInfoStep2Screen(
            purchaseMethod: settings.arguments as PurchaseMethod,
          ),
        );
      case ordersManagement:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OrdersManagementScreen(),
        );
      case basket:
        return _buildRouteNavigationWithoutEffect(
          settings,
          BasketScreen(),
        );
      case accountSetting:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const AccountSetting(),
        );
      case orderDetail:
        return _buildRouteNavigationWithoutEffect(
          settings,
          OrderDetailScreen(order: settings.arguments! as OrderUIModel),
        );
      case trackYourOrder:
        return _buildRouteNavigationWithoutEffect(
          settings,
          TrackYourOrderScreen(order: settings.arguments! as OrderUIModel),
        );
      case myAddresses:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const MyAddressesScreen(),
        );
      case coin:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const CoinScreen(),
        );
      case exchangeCoin:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ExchangeCoinScreen(),
        );
      case scanAndGoIntroduction:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ScanAndGoIntroductionScreen(),
        );
      case scanAndGoToCart:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ScanAndGoToCartScreen(),
        );
      case scanAndGoDeliveryMethod:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ScanAndGoDeliveryMethodScreen(),
        );
      case voucherPayment:
        return _buildRouteNavigationWithoutEffect(
          settings,
          VoucherPaymentScreen(
            voucher: settings.arguments! as VoucherUIModel,
          ),
        );
      case voucherBarCode:
        return _buildRouteNavigationWithoutEffect(
          settings,
          VoucherBarCodeScreen(
            voucherId: settings.arguments! as String,
          ),
        );
      case scanAndGoBarCode:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ScanAndGoBarCodeScreen(
            cartId: settings.arguments! as String,
          ),
        );
      case quickLogin:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SettingQuickLoginScreen(),
        );
      case finerPrintLogin:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const FingerprintLoginScreen(),
        );
      case directPaymentMethod:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const DirectPaymentMethodScreen(),
        );
      case onlinePayment:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const OnlinePaymentScreen(),
        );
      case inviteFriend:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const InviteFriendScreen(),
        );
      case scan:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ScanScreen(),
        );
      case accountGift:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const AccountGiftScreen(),
        );
      case productDetail:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ProductDetailScreen(
            productUIModel: settings.arguments! as ProductUIModel,
          ),
        );
      case editMyAddress:
        return _buildRouteNavigationWithoutEffect(
          settings,
          EditMyAddressScreen(
            arguments: settings.arguments as MyAddressArguments,
          ),
        );
      case addNewDeliveryAddress:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const AddNewDeliveryAddressScreen(),
        );
      case choosenAddress:
        return _buildRouteNavigationWithoutEffect(
          settings,
          SelectAddressScreen(
            arguments: settings.arguments as SelectAddressArguments,
          ),
        );
      case voucherDetail:
        return _buildRouteNavigationWithoutEffect(
          settings,
          BuyVoucherDetailScreen(
            voucher: settings.arguments as VoucherUIModel,
          ),
        );
      case applicableStores:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ApplicableStoresScreen(
            stores: settings.arguments as List<BranchUIModel>,
          ),
        );
      case paymentSetting:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const PaymentSettingScreen(),
        );
      case addPaymentInformation:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const AddPaymentMethodScreen(),
        );
      case addCreditCard:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const AddCreditCardScreen(),
        );
      case scanAndGoOrderConfirm:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const ScanAndGoOrderConfirmScreen(),
        );
      case coupon:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const CouponScreen(),
        );
      case searchProduct:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SearchProductScreen(),
        );
      case yourVoucherDetail:
        return _buildRouteNavigationWithoutEffect(
          settings,
          YourVoucherDetailScreen(
            voucher: settings.arguments as VoucherUIModel,
          ),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static void onRouteChanged(String screenName) {
    if (EnvironmentUtil.currentEnv == Environment.prod) {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ));
    }
    if (['', null].contains(screenName)) {
      return;
    }
  }
}
