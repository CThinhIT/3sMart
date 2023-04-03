import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_popup.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';

class SelectSupertmarket extends StatefulWidget {
  const SelectSupertmarket({Key? key}) : super(key: key);

  @override
  State<SelectSupertmarket> createState() => _SelectSupertmarketState();
}

class _SelectSupertmarketState extends State<SelectSupertmarket> {
  GlobalKey keySelectSupermarket = GlobalKey();
  var _viewModel;
  bool _isDialogShowing = false;
  @override
  void initState() {
    super.initState();
    _viewModel = context.read<IOrderInfoViewModel>();
    Future.delayed(Duration.zero, () async {
      await _viewModel.init();
      if (_viewModel.tutorialState) {
        _showDialog();
        _viewModel.tutorialState = !_viewModel.tutorialState;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      key: keySelectSupermarket,
      onPressed: () {
        Get.toNamed(MyRouter.selectBranchToShop);
      },
      child: Container(
          padding: EdgeInsets.all(3.r),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _isDialogShowing ? ColorUtils.white : null,
          ),
          child: Center(child: _supermarket())),
    );
  }

  _showDialog() {
    setState(() {
      _isDialogShowing = !_isDialogShowing;
    });
    RRect highlights;
    final keyContext = keySelectSupermarket.currentContext;
    final box = keyContext!.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    double left = offset.dx;
    double top = offset.dy;
    double width = box.size.width;
    double height = box.size.height;
    highlights = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, width, height),
      Radius.circular(8.r),
    );
    Get.dialog(
      CustomPopup(
        highlights: highlights,
        child: _ChangeStoreGuideWidget(
          branchName: locator<GlobalData>().deviceInfo.branchName,
          leading: _supermarket(),
          paddingTop: top + height,
          onPressed: () => setState(
            () {
              _isDialogShowing = !_isDialogShowing;
            },
          ),
        ),
      ),
      barrierColor: Colors.white.withOpacity(0),
      useSafeArea: false,
    );
  }

  Widget _supermarket() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 8.w),
        Image.asset(
          'assets/images/ic_supermarket.png',
          width: 23.w,
          color:
              _isDialogShowing ? ColorUtils.primaryRedColor : ColorUtils.white,
        ),
        SizedBox(width: 12.w),
        Padding(
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            locator<GlobalData>().deviceInfo.branchName,
            style: TextStyleUtils.bodyStrong.copyWith(
              color: _isDialogShowing
                  ? ColorUtils.primaryRedColor
                  : ColorUtils.white,
            ),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }
}

class _ChangeStoreGuideWidget extends StatefulWidget {
  final Widget leading;
  final String branchName;
  final double paddingTop;
  final Function onPressed;
  const _ChangeStoreGuideWidget({
    Key? key,
    required this.leading,
    required this.paddingTop,
    required this.onPressed,
    required this.branchName,
  }) : super(key: key);

  @override
  _ChangeStoreGuideWidgetState createState() => _ChangeStoreGuideWidgetState();

  @override
  dismiss() {}
}

class _ChangeStoreGuideWidgetState extends State<_ChangeStoreGuideWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: widget.paddingTop),
        child: SizedBox(
          width: 335.w,
          child: IntrinsicHeight(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.leading,
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      Strings.changeTheStore.tr,
                      style: TextStyleUtils.largeHeading2.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppTranslation.translateTemplate(
                        Strings.currentBranchAndChangeStore,
                        {'store': widget.branchName},
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.body.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButton(
                      onPressed: () async {
                        await widget.onPressed();
                        Get.back();
                      },
                      child: Text(
                        Strings.iUnderstand.tr,
                        style: TextStyleUtils.body.copyWith(
                          color: ColorUtils.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
