import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/widgets/account_item_widget.dart';
import 'package:provider/provider.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);
  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  late IAuthViewModel _viewModel;

  @override
  void initState() {
    _viewModel = context.read<IAuthViewModel>();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await _viewModel.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.setting.tr,
          style: TextStyleUtils.heading3.copyWith(color: ColorUtils.black),
        ),
        leading: const BackButton(color: ColorUtils.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 48.h,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color(0xFFF9F9F9),
            thickness: 8,
          ),
          Consumer<IAuthViewModel>(builder: (_, _viewModel, __) {
            return _viewModel.isSupportFingerprint
                ? Column(
                    children: [
                      AccountItemWidget(
                        image: 'assets/images/fingerprint_fill.svg',
                        name: Strings.quickLoginSetups.tr,
                        onPressed: () {},
                        child: SizedBox(
                          height: 24.h,
                          width: 44.w,
                          child: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              onChanged: (bool value) async {
                                await _viewModel.changeValueFingerprint(value);
                              },
                              value: _viewModel.isActiveFingerprint,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5.h,
                        color: ColorUtils.black.withOpacity(0.2),
                        height: 0.h,
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          }),
          AccountItemWidget(
            image: 'assets/images/time_fill.svg',
            name: Strings.setAutoLock.tr,
            onPressed: () {
              //TODO
            },
          ),
          const Divider(
            color: Color(0xFFF9F9F9),
            thickness: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/global_fill.svg',
                      height: 21.h,
                      width: 18.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 11.w),
                    Text(
                      Strings.language.tr,
                      style: TextStyleUtils.button.copyWith(
                        color: ColorUtils.primaryBlackColor,
                      ),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: AppTranslation.currentLanguage,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  iconSize: 24,
                  elevation: 16,
                  style:
                      TextStyleUtils.button.copyWith(color: ColorUtils.black60),
                  underline: const SizedBox.shrink(),
                  onChanged: (String? newValue) {
                    AppTranslation.switchLanguage();
                    setState(() {});
                  },
                  items: <String>[
                    AppTranslation.LANGUAGES[AppTranslation.LANG_CODE_EN]!,
                    AppTranslation.LANGUAGES[AppTranslation.LANG_CODE_VI]!,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFF9F9F9),
            thickness: 8,
          ),
          AccountItemWidget(
            image: 'assets/images/logout_box_r_fill.svg',
            name: Strings.logout.tr,
            onPressed: () async {
              await Provider.of<IAuthViewModel>(context, listen: false)
                  .logout();
            },
            child: const SizedBox.shrink(),
          ),
          const Divider(
            color: Color(0xFFF9F9F9),
            thickness: 8,
          ),
        ],
      ),
    );
  }
}
