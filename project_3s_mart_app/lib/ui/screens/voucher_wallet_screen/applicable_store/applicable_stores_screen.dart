import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ivoucher_view_model.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/store_item.dart';
import 'package:provider/provider.dart';

class ApplicableStoresScreen extends StatefulWidget {
  final List<BranchUIModel> stores;
  const ApplicableStoresScreen({
    Key? key,
    required this.stores,
  }) : super(key: key);

  @override
  State<ApplicableStoresScreen> createState() => _ApplicableStoresScreenState();
}

class _ApplicableStoresScreenState extends State<ApplicableStoresScreen> {
  @override
  void initState() {
    super.initState();
    var viewModel = context.read<IVoucherViewModel>();
    Future.delayed(
      Duration.zero,
      () async {
        await viewModel.initStoreList(widget.stores);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.storesList.tr),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        toolbarHeight: 48.h,
        titleTextStyle: TextStyleUtils.heading3.copyWith(
          color: ColorUtils.black,
        ),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: ColorUtils.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 24.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.applicablePromoStores.tr,
                    style: TextStyleUtils.largeHeading2
                        .copyWith(color: ColorUtils.black86),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Consumer<IVoucherViewModel>(
                      builder: (context, vm, child) => Text(
                        "${vm.allStores.length} ${Strings.stores.tr}",
                        style: TextStyleUtils.footnoteSemiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Consumer<IVoucherViewModel>(
              builder: (_, vm, __) => _StoreList(
                title: Text(
                  '${Strings.nearMe.tr} (${vm.nearbyStores.length})',
                  style:
                      TextStyleUtils.title.copyWith(color: ColorUtils.black86),
                ),
                stores: vm.nearbyStores,
                distanceColor: ColorUtils.green,
              ),
            ),
            Consumer<IVoucherViewModel>(
              builder: (_, vm, __) => _StoreList(
                title: Text(
                  '${Strings.otherStores.tr} (${vm.otherStores.length})',
                  style:
                      TextStyleUtils.title.copyWith(color: ColorUtils.black86),
                ),
                stores: vm.otherStores,
                distanceColor: ColorUtils.primaryRedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoreList extends StatelessWidget {
  const _StoreList({
    Key? key,
    required this.stores,
    required this.title,
    required this.distanceColor,
  }) : super(key: key);
  final Widget title;
  final List<BranchUIModel> stores;
  final Color distanceColor;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      textColor: ColorUtils.black60,
      iconColor: ColorUtils.black60,
      title: title,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 24.w, 16.h),
            child: StoreItem(
              name: stores[index].name,
              address: stores[index].address,
              distance: stores[index].distance,
              distanceColor: distanceColor,
            ),
          ),
          separatorBuilder: (_, __) => Divider(
            height: 2.h,
            thickness: 2.h,
            color: ColorUtils.divider,
          ),
          itemCount: stores.length,
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
        ),
      ],
    );
  }
}
