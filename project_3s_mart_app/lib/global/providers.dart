import 'package:project_3s_mart_app/core/view_models/screens/implements/auth_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/basket_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/carousel_slider_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/category_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/coin_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/my_address_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/home_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/order_info_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/orders_management_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/payment_account_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/product_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/scan_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/select_a_branch_group_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/select_purchase_method_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/splash_screen_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/implements/voucher_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icarousel_slider_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icategory_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icoin_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ihome_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorders_management_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ipayment_account.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iproduct_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iscan_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_a_branch_group_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_purchase_method_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/isplash_screen_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ivoucher_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<ISplashScreenViewModel>(
    create: (_) => SplashScreenViewModel(),
  ),
  ChangeNotifierProvider<ICarouselSliderViewModel>(
    create: (_) => CarouselSliderViewModel(),
  ),
  ChangeNotifierProvider<ISelectPurchaseMethodViewModel>(
    create: (_) => SelectPurchaseMethodViewModel(),
  ),
  ChangeNotifierProvider<IOrderInfoViewModel>(
    create: (_) => OrderInfoViewModel(),
  ),
  ChangeNotifierProvider<ISelectABranchGroupViewModel>(
    create: (_) => SelectABranchGroupViewModel(),
  ),
  ChangeNotifierProvider<ICategoryViewModel>(
    create: (_) => CategoryViewModel(),
  ),
  ChangeNotifierProvider<IHomeViewModel>(
    create: (_) => HomeViewModel(),
  ),
  ChangeNotifierProvider<IVoucherViewModel>(
    create: (_) => VoucherViewModel(),
  ),
  ChangeNotifierProvider<IOrdersManagementViewModel>(
    create: (_) => OrdersManagementViewModel(),
  ),
  ChangeNotifierProvider<IBasketViewModel>(
    create: (_) => BasketViewModel(),
  ),
  ChangeNotifierProvider<ICoinViewModel>(
    create: (_) => CoinViewModel(),
  ),
  ChangeNotifierProvider<IAuthViewModel>(
    create: (_) => AuthViewModel(),
  ),
  ChangeNotifierProvider<IScanViewModel>(
    create: (_) => ScanViewModel(),
  ),
  ChangeNotifierProvider<IProductViewModel>(
    create: (_) => ProductViewModel(),
  ),
  ChangeNotifierProvider<IMyAddressViewModel>(
    create: (_) => MyAddressViewModel(),
  ),
    ChangeNotifierProvider<IPaymentAccountViewModel>(
    create: (_) => PaymentAccountViewModel(),
  ),
];
