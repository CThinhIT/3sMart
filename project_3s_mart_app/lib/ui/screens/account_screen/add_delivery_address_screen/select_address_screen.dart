import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/edit_myaddress_screen/edit_myaddress_screen.dart';
import 'package:provider/provider.dart';

class SelectAddressArguments {
  final List<dynamic> listOfAddress;
  final String title;
  final bool isProvinceFocused;
  final bool isDistrictFocused;
  final bool isWardFocused;
  final bool isOrderStep;

  SelectAddressArguments({
    required this.listOfAddress,
    required this.title,
    this.isProvinceFocused = false,
    this.isDistrictFocused = false,
    this.isWardFocused = false,
    this.isOrderStep = false,
  });
}

class SelectAddressScreen extends StatefulWidget {
  final SelectAddressArguments arguments;
  const SelectAddressScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  late IMyAddressViewModel viewModel;

  late List<dynamic> filteredElements;
  @override
  void initState() {
    viewModel = context.read<IMyAddressViewModel>();
    filteredElements = widget.arguments.listOfAddress;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.arguments.listOfAddress
          .where((e) => e.name!.toUpperCase().contains(s))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var argument = widget.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.choose.tr + ' ' + argument.title,
          style: TextStyleUtils.heading3
              .copyWith(color: ColorUtils.primaryBlackColor),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 48.h,
        backgroundColor: ColorUtils.white,
        foregroundColor: ColorUtils.primaryBlackColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 10.w,
                    top: 5.h,
                  ),
                  child: const Icon(
                    CupertinoIcons.search,
                  ),
                ),
                fillColor: const Color(0xFFEFEEEE),
                hintText: Strings.hintSearchAddres.tr,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: const Color(0xFF979797),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _filterElements,
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: filteredElements.isNotEmpty
                ? ListView.separated(
                    itemCount: filteredElements.length,
                    itemBuilder: (context, index) => RippleClickEffect(
                      onPressed: () {
                        if (argument.isProvinceFocused) {
                          viewModel.currentProvince = filteredElements[index];
                          Get.offNamed(
                            MyRouter.choosenAddress,
                            arguments: SelectAddressArguments(
                              listOfAddress:
                                  viewModel.currentProvince.districts!,
                              title: Strings.district.tr,
                              isDistrictFocused: true,
                              isOrderStep: argument.isOrderStep,
                            ),
                            preventDuplicates: false,
                          );
                        }
                        if (argument.isDistrictFocused) {
                          viewModel.currentDistrict = filteredElements[index];
                          Get.offNamed(
                            MyRouter.choosenAddress,
                            arguments: SelectAddressArguments(
                              listOfAddress: viewModel.currentDistrict.wards!,
                              title: Strings.wardOrCommune.tr,
                              isWardFocused: true,
                              isOrderStep: argument.isOrderStep,
                            ),
                            preventDuplicates: false,
                          );
                        }
                        if (argument.isWardFocused) {
                          viewModel.currentWard = filteredElements[index];
                          if (!widget.arguments.isOrderStep) {
                            final newAccount = locator<GlobalData>().newAccount;
                            Get.offNamedUntil(
                              MyRouter.editMyAddress,
                              (route) =>
                                  route.settings.name == MyRouter.myAddresses,
                              arguments: MyAddressArguments(
                                myAddress: DeliveryAddressUIModel(
                                  fullName: newAccount.userName,
                                  phoneNumber: newAccount.phoneNumber,
                                  district: viewModel.currentDistrict.name,
                                  province: viewModel.currentProvince.name,
                                  ward: viewModel.currentWard.name,
                                ),
                                isNewAddress: true,
                              ),
                            );
                          } else {
                            Get.back();
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: Text(
                          filteredElements[index].name,
                          style: TextStyleUtils.button.copyWith(
                            color: ColorUtils.primaryBlackColor,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, index) => Divider(
                      thickness: 1.h,
                      height: 12.h,
                      color: ColorUtils.divider,
                    ),
                  )
                : Center(
                    child: Text(
                      Strings.notFound.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
