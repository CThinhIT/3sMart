import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/more_bottom_sheet.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/edit_myaddress_screen/edit_myaddress_screen.dart';
import 'package:provider/provider.dart';

class MyAddressesScreen extends StatefulWidget {
  const MyAddressesScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressesScreen> createState() => _MyAddressesScreenState();
}

class _MyAddressesScreenState extends State<MyAddressesScreen> {
  late IMyAddressViewModel viewModel;
  @override
  void initState() {
    viewModel = context.read<IMyAddressViewModel>();
    Future.delayed(Duration.zero, () async {
      await viewModel.getListLocation();
      viewModel.getAllDeliveryAddressInDB();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.myAddresses.tr,
        ),
      ),
      body: Consumer<IMyAddressViewModel>(
        builder: (_, __, ___) {
          return ListView(
            children: [
              ...viewModel.listDeliveryAddressInDb.map(
                (e) => _BuildAddressCard(
                  address: e,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: const _TextButtonAdd(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TextButtonAdd extends StatelessWidget {
  const _TextButtonAdd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Get.toNamed(MyRouter.addNewDeliveryAddress);
      },
      btnColor: Colors.transparent,
      borderColor: Colors.transparent,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.add,
            size: 20.sp,
            color: ColorUtils.blueIOS,
          ),
          SizedBox(
            width: 13.w,
          ),
          Text(
            Strings.newDeliveryAddress.tr,
            style: TextStyleUtils.button.copyWith(
              color: ColorUtils.blueIOS,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildAddressCard extends StatelessWidget {
  final DeliveryAddressUIModel address;
  const _BuildAddressCard({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        right: 16.w,
        left: 16.w,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.fullName,
                style: TextStyleUtils.bodyStrong
                    .copyWith(color: ColorUtils.primaryBlackColor),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                address.phoneNumber.replaceAllMapped(
                    RegExp(r'(\d{3})(\d{3})(\d+)'),
                    (Match m) => "${m[1]} ${m[2]} ${m[3]}"),
                style: TextStyleUtils.body.copyWith(color: ColorUtils.black60),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "${address.address}, ${address.ward}, ${address.district}, ${address.province}",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyleUtils.body.copyWith(color: ColorUtils.black60),
              ),
              address.isDefaultAddress
                  ? Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: ColorUtils.green,
                          size: 20.sp,
                        ),
                        Text(
                          Strings.defaultAddress.tr,
                          style: TextStyleUtils.bodyStrong
                              .copyWith(color: ColorUtils.green),
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: 8.h,
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: ColorUtils.divider,
              ),
            ],
          ),
          Positioned(
            top: -15.h,
            right: 1.w,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => MoreBodyBottomSheet(
                    onPressItem1: () {
                      Get.back();
                      Get.toNamed(
                        MyRouter.editMyAddress,
                        arguments: MyAddressArguments(
                          myAddress: address,
                          isNewAddress: false,
                        ),
                      );
                    },
                    onPressItem2: () async {
                      Get.back();
                      await Provider.of<IMyAddressViewModel>(context,
                              listen: false)
                          .deleteAddress(address.id);
                    },
                    textItem1: Strings.edit.tr,
                    textItem2: Strings.deleteAddress.tr,
                  ),
                );
              },
              icon: Icon(
                Icons.more_horiz,
                size: 30.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
