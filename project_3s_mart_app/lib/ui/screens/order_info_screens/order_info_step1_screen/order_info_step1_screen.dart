import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/utils/validate_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/widgets/build_text_edit_widget.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step1_screen/widgets/add_new_delivery_address.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:provider/provider.dart';

part 'widgets/body_of_draggable_for_delivery_time.dart';
part 'widgets/delivery_address_widget.dart';
part 'widgets/delivery_time_wiget.dart';
part 'widgets/note_widget.dart';
part 'widgets/receiver.dart';
part 'widgets/basket_item_list.dart';

class OrderInfoStep1Screen extends StatefulWidget {
  const OrderInfoStep1Screen({
    Key? key,
    required this.purchaseMethod,
  }) : super(key: key);

  final PurchaseMethod purchaseMethod;

  @override
  State<OrderInfoStep1Screen> createState() => _OrderInfoStep1ScreenState();
}

class _OrderInfoStep1ScreenState extends State<OrderInfoStep1Screen> {
  late IOrderInfoViewModel viewmodel;
  late IBasketViewModel _basketViewModel;
  late IMyAddressViewModel _addressViewModel;
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  final TextEditingController _noteController = TextEditingController();
  final GlobalKey<FormState> _fullNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneNumberKey = GlobalKey<FormState>();
  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _phoneNumberFocus = FocusNode();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewmodel = context.read<IOrderInfoViewModel>();
    _basketViewModel = context.read<IBasketViewModel>();
    _addressViewModel = context.read<IMyAddressViewModel>();
    Future.delayed(Duration.zero, () async {
      _basketViewModel.init();
      await viewmodel.init();
      viewmodel.resetFormOrderInfo();
      await _addressViewModel.getListLocation();
      _addressViewModel.getAllDeliveryAddressInDB();
    });

    _phoneNumberController = TextEditingController(
        text: locator<GlobalData>().accountInfo.phoneNumber);
    _fullNameController =
        TextEditingController(text: locator<GlobalData>().accountInfo.userName);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _noteController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.orderDetails.tr,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProgressOrderInfoWidget(
                currentOrderStep:
                    widget.purchaseMethod == PurchaseMethod.scanAndGo
                        ? ProgressOrderInfo.deliveryMethod
                        : ProgressOrderInfo.address,
                isScanAndGoOrderProgress:
                    widget.purchaseMethod == PurchaseMethod.scanAndGo,
              ),
              SizedBox(height: 12.h),
              _BuildReceiver(
                fullNameController: _fullNameController,
                phoneNumberController: _phoneNumberController,
                fullNameFocus: _fullNameFocus,
                phoneNumberFocus: _phoneNumberFocus,
                fullNameKey: _fullNameKey,
                phoneNumberKey: _phoneNumberKey,
              ),
              Divider(
                thickness: 4.h,
                color: const Color(0xFFEBEBEB),
                height: 30.h,
              ),
              const Flexible(
                child: _DeliveryAddress(),
              ),
              Divider(
                thickness: 4.h,
                color: const Color(0xFFEBEBEB),
                height: 30.h,
              ),
              const _DeliveryTime(),
              Divider(
                thickness: 4.h,
                color: const Color(0xFFEBEBEB),
                height: 30.h,
              ),
              _Note(
                noteController: _noteController,
              ),
              Divider(
                thickness: 4.h,
                color: const Color(0xFFEBEBEB),
                height: 30.h,
              ),
              const _BasketItemList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<IOrderInfoViewModel>(
        builder: (_, _vm, __) => ButtonBottom(
          onPressed: viewmodel.isEnableButton
              ? () {
                  //await viewmodel.commitCustomerAndAddress();
                  Get.toNamed(
                    MyRouter.orderInfoStep2,
                    arguments: widget.purchaseMethod,
                  );
                }
              : null,
          title: Strings.lblGoNext.tr,
        ),
      ),
    );
  }
}
