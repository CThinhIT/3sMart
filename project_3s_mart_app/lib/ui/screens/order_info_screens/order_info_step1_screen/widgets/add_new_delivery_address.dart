import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/add_delivery_address_screen/select_address_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/widgets/build_text_edit_widget.dart';
import 'package:provider/provider.dart';

class NewDeliveryAddress extends StatefulWidget {
  const NewDeliveryAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<NewDeliveryAddress> createState() => _NewDeliveryAddressState();
}

class _NewDeliveryAddressState extends State<NewDeliveryAddress> {
  late final IMyAddressViewModel viewModel;
  late TextEditingController provinceController;
  late TextEditingController districtController;
  late TextEditingController wardController;
  late TextEditingController addressController;

  @override
  void initState() {
    viewModel = context.read<IMyAddressViewModel>();
    Future.delayed(Duration.zero, () async {
      viewModel.init();
    });
    provinceController = TextEditingController();
    districtController = TextEditingController();
    wardController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    provinceController.dispose();
    districtController.dispose();
    wardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 48.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.close,
                        color: ColorUtils.black86,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      Strings.newDeliveryAddress.tr,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: ColorUtils.divider,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
              ),
              child:
                  Consumer<IMyAddressViewModel>(builder: (_, _viewModel, __) {
                provinceController.text = _viewModel.currentProvince.name;
                districtController.text = _viewModel.currentDistrict.name;
                wardController.text = _viewModel.currentWard.name;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Strings.deliveryAddress.tr,
                      style: TextStyleUtils.title.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    BuildTextFormFieldWidget(
                      labelTextWithRequire: Strings.province.tr,
                      readOnly: true,
                      onTap: () {
                        Get.toNamed(
                          MyRouter.choosenAddress,
                          arguments: SelectAddressArguments(
                            listOfAddress: viewModel.listLocations,
                            title: Strings.province.tr,
                            isProvinceFocused: true,
                            isOrderStep: true,
                          ),
                          preventDuplicates: false,
                        );
                      },
                      controller: provinceController,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.sp,
                        color: ColorUtils.subTileButtonColor,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    BuildTextFormFieldWidget(
                      labelTextWithRequire: Strings.district.tr,
                      readOnly: true,
                      onTap: () {
                        Get.toNamed(
                          MyRouter.choosenAddress,
                          arguments: SelectAddressArguments(
                            listOfAddress: viewModel.currentDistrict.name == ''
                                ? viewModel.listLocations
                                : viewModel.currentProvince.districts!,
                            title: viewModel.currentDistrict.name == ''
                                ? Strings.province.tr
                                : Strings.district.tr,
                            isDistrictFocused:
                                viewModel.currentDistrict.name != '',
                            isProvinceFocused:
                                viewModel.currentDistrict.name == '',
                            isOrderStep: true,
                          ),
                          preventDuplicates: false,
                        );
                      },
                      controller: districtController,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.sp,
                        color: ColorUtils.subTileButtonColor,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    BuildTextFormFieldWidget(
                      labelTextWithRequire: Strings.ward.tr,
                      readOnly: true,
                      onTap: () {
                        Get.toNamed(
                          MyRouter.choosenAddress,
                          arguments: SelectAddressArguments(
                            listOfAddress: viewModel.currentProvince.name == ''
                                ? viewModel.listLocations
                                : viewModel.currentDistrict.name == ''
                                    ? viewModel.currentProvince.districts!
                                    : viewModel.currentDistrict.wards!,
                            title: viewModel.currentProvince.name == ''
                                ? Strings.province.tr
                                : viewModel.currentDistrict.name == ''
                                    ? Strings.district.tr
                                    : Strings.ward.tr,
                            isWardFocused:
                                viewModel.currentDistrict.name != '' &&
                                    viewModel.currentProvince.name != '',
                            isOrderStep: true,
                            isDistrictFocused:
                                viewModel.currentProvince.name == '',
                            isProvinceFocused:
                                viewModel.currentDistrict.name == '',
                          ),
                          preventDuplicates: false,
                        );
                      },
                      controller: wardController,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.sp,
                        color: ColorUtils.subTileButtonColor,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    BuildTextFormFieldWidget(
                      labelText: Strings.address.tr,
                      controller: addressController,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomButton(
                      onPressed: addressController.text.isNotEmpty &&
                              provinceController.text.isNotEmpty &&
                              districtController.text.isNotEmpty &&
                              wardController.text.isNotEmpty
                          ? () async {
                              DeliveryAddressEntity newDeliveryAddressToAdd =
                                  DeliveryAddressEntity(
                                fullName:
                                    locator<GlobalData>().accountInfo.userName,
                                phoneNumber: locator<GlobalData>()
                                    .accountInfo
                                    .phoneNumber,
                                province: provinceController.text,
                                district: districtController.text,
                                ward: wardController.text,
                                address: addressController.text,
                                isDefaultAddress: false,
                              );
                              await _viewModel
                                  .addAddress(newDeliveryAddressToAdd);

                              Get.back();
                            }
                          : null,
                      child: Text(
                        Strings.newDeliveryAddress.tr,
                        style: TextStyleUtils.button.copyWith(
                          color: ColorUtils.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
