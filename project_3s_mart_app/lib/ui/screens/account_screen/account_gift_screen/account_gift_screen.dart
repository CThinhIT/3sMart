import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/decorated_tap_bar.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/account_gift_screen/widgets/gift_empty_state.dart';

class AccountGiftScreen extends StatefulWidget {
  const AccountGiftScreen({Key? key}) : super(key: key);

  @override
  _AccountGiftScreenState createState() => _AccountGiftScreenState();
}

class _AccountGiftScreenState extends State<AccountGiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.gifts.tr,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 150.0,
              ),
              child: DecoratedTabBar(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorUtils.black40,
                      width: 2.w,
                    ),
                  ),
                ),
                tabBar: TabBar(
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                        color: ColorUtils.primaryRedColor, width: 2.0),
                  ),
                  labelColor: ColorUtils.primaryRedColor,
                  unselectedLabelColor: ColorUtils.black40,
                  tabs: [
                    Tab(
                      child: Text(
                        Strings.toReceive.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        Strings.received.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  GiftEmptyState(),
                  GiftEmptyState(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
