import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_3s_mart_app/core/ui_models/coupon_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:project_3s_mart_app/ui/common_widgets/discount_code.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/screens/coupon_screen/widgets/coupon_list.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_and_go_cart/widgets/scan_and_go_cart_footer.dart';
import 'package:provider/provider.dart';
part 'widgets/note_widget.dart';

class ScanAndGoDeliveryMethodScreen extends StatefulWidget {
  const ScanAndGoDeliveryMethodScreen({Key? key}) : super(key: key);

  @override
  _ScanAndGoDeliveryMethodScreenState createState() =>
      _ScanAndGoDeliveryMethodScreenState();
}

class _ScanAndGoDeliveryMethodScreenState
    extends State<ScanAndGoDeliveryMethodScreen> {
  late IOrderInfoViewModel viewmodel;
  @override
  void initState() {
    viewmodel = context.read<IOrderInfoViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ScanAndGoCartFooter(
        title: Strings.placeOrder.tr,
        onPressed: () {
          if (viewmodel.deliveryMethod ==
              DeliveryMethod.pickUpLaterAtTheCounter) {
            Get.toNamed(MyRouter.scanAndGoOrderConfirm);
          } else if (viewmodel.deliveryMethod == DeliveryMethod.homeDelivery) {
            Get.toNamed(
              MyRouter.orderInfoStep1,
              arguments: PurchaseMethod.scanAndGo,
            );
          }
        },
      ),
      backgroundColor: ColorUtils.greyLight2,
      appBar: CustomAppBar(
        AppBarOption(title: Strings.orderDetails.tr),
      ),
      body: SingleChildScrollView(
        reverse: true,
        controller: ScrollController(initialScrollOffset: 99999),
        child: Column(
          children: [
            const ProgressOrderInfoWidget(
              currentOrderStep: ProgressOrderInfo.deliveryMethod,
              isScanAndGoOrderProgress: true,
            ),
            Container(
              color: ColorUtils.white,
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.deliveryMethod.tr,
                    style: TextStyleUtils.title,
                  ),
                  RippleClickEffect(
                    onPressed: () {},
                    child: Icon(
                      CupertinoIcons.question_circle,
                      color: const Color(0xFF3771F4),
                      size: 17.r,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _BuildDeliveryMethodValueButton(
                  image: 'assets/images/homeDelivery.png',
                  deliveryMethod: DeliveryMethod.homeDelivery,
                  onPressed: () {
                    viewmodel.deliveryMethod = DeliveryMethod.homeDelivery;
                  },
                ),
                _BuildDeliveryMethodValueButton(
                  image: 'assets/images/pickUpLater.png',
                  deliveryMethod: DeliveryMethod.pickUpLaterAtTheCounter,
                  onPressed: () {
                    viewmodel.deliveryMethod =
                        DeliveryMethod.pickUpLaterAtTheCounter;
                  },
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const _BuildNote(),
            SizedBox(height: 8.h),
            const DiscountCode(),
            SizedBox(height: 4.h),
            Container(
              color: ColorUtils.greyLight2,
              child: QuickCouponList(
                coupons: CouponUIModel.fakeList,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BuildNote extends StatelessWidget {
  const _BuildNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RippleClickEffect(
        onPressed: () {
          showCupertinoModalBottomSheet(
              context: context,
              expand: true,
              builder: (context) => const _NoteWidget());
        },
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Consumer<IOrderInfoViewModel>(builder: (_, _viewModel, __) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/note.svg'),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    _viewModel.note.isNotEmpty
                        ? _viewModel.note
                        : Strings.hintNote.tr,
                    style: TextStyleUtils.body.copyWith(
                      color: ColorUtils.black60,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                _viewModel.note.isNotEmpty
                    ? const Icon(Icons.edit)
                    : const SizedBox.shrink()
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _BuildDeliveryMethodValueButton extends StatelessWidget {
  final String image;
  final DeliveryMethod deliveryMethod;
  final VoidCallback onPressed;
  const _BuildDeliveryMethodValueButton({
    Key? key,
    required this.image,
    required this.deliveryMethod,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    return Selector<IOrderInfoViewModel, DeliveryMethod>(
      selector: (_, __) => viewmodel.deliveryMethod,
      builder: (_, __, ___) {
        bool active = viewmodel.deliveryMethod == deliveryMethod;
        return Container(
          color: ColorUtils.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: ButtonBorderWithDot(
            active: active,
            onPressed: onPressed,
            image: image,
            name: EnumHelper.getDescription(
              EnumMap.deliveryMethod,
              deliveryMethod,
            ),
          ),
        );
      },
    );
  }
}
