import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/global/app_text.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';

AppBar appBar3sMart(BuildContext context) {
  return AppBar(
    title: const Text(
      AppText.title,
    ),
    titleTextStyle: TextStyle(
      fontSize: 35.sp,
      fontWeight: FontWeight.w900,
      color: ColorUtils.primaryRedColor,
    ),
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: false,
    toolbarHeight: 48.h,
    backgroundColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    actions: [
      IconButton(
        onPressed: () async {
          showModalBottomSheet(
              context: context,
              backgroundColor: ColorUtils.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
              ),
              builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          right: 16.w,
                          left: 16.w,
                          bottom: 12.h,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: RippleClickEffect(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Icon(Icons.close),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                Strings.lblChangeLanguage.tr,
                                style: TextStyleUtils.body.copyWith(
                                  color: ColorUtils.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: const Color(0xFFE2E2E2),
                        thickness: 1,
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 25.h,
                        ),
                        child: Consumer<IAuthViewModel>(
                            builder: (_, _viewModel, __) {
                          return Column(
                            children: [
                              _BuildButtonLanguage(
                                shortName: 'VI',
                                name: 'Tiếng Việt',
                                active: AppTranslation.currentLanguageCode ==
                                    AppTranslation.LANG_CODE_VI,
                                changeLanguage: () {
                                  _viewModel.switchLanguage();
                                  Get.back();
                                },
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              _BuildButtonLanguage(
                                shortName: 'EN',
                                name: 'English',
                                active: AppTranslation.currentLanguageCode ==
                                    AppTranslation.LANG_CODE_EN,
                                changeLanguage: () {
                                  _viewModel.switchLanguage();
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ));
        },
        icon: Container(
          width: 26.r,
          height: 26.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.primaryRedColor,
          ),
          alignment: Alignment.center,
          child: Text(
            AppTranslation.currentLanguageCode == AppTranslation.LANG_CODE_VI
                ? 'VI'
                : 'EN',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    ],
  );
}

class _BuildButtonLanguage extends StatelessWidget {
  final VoidCallback changeLanguage;
  final String shortName;
  final String name;
  final bool active;
  const _BuildButtonLanguage({
    Key? key,
    required this.name,
    required this.shortName,
    required this.active,
    required this.changeLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBorderWithDot(
      onPressed: changeLanguage,
      active: active,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? ColorUtils.primaryRedColor
                      : const Color(0xFF2963D3),
                ),
                alignment: Alignment.center,
                child: Text(
                  shortName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.primaryBlackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
