import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';
import 'package:project_3s_mart_app/core/services/interfaces/idelivery_address_service.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/location_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/utils/validate_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/add_delivery_address_screen/select_address_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/widgets/build_text_edit_widget.dart';
import 'package:project_3s_mart_app/ui/utils/loading_dialog_utils.dart';
import 'package:provider/provider.dart';

class MyAddressArguments {
  final DeliveryAddressUIModel myAddress;
  final bool isNewAddress;
  MyAddressArguments({
    required this.myAddress,
    required this.isNewAddress,
  });
}

class EditMyAddressScreen extends StatefulWidget {
  final MyAddressArguments arguments;
  const EditMyAddressScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  _EditMyAddressScreenState createState() => _EditMyAddressScreenState();
}

class _EditMyAddressScreenState extends State<EditMyAddressScreen> {
  late IMyAddressViewModel viewmodel;
  late TextEditingController addressController,
      phoneNumberController,
      fullNameController,
      provinceController,
      districtController,
      wardController;
  late GlobalKey<FormState> fullNameKey,
      phoneNumberKey,
      addressKey,
      provinceKey,
      districtKey,
      wardKey;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneNumberController.dispose();
    fullNameController.dispose();
    Future.delayed(Duration.zero, () {
      viewmodel.currentDistrict = DistrictModel();
      viewmodel.currentProvince = ProvinceModel();
      viewmodel.currentWard = WardModel();
    });

    super.dispose();
  }

  void initData() {
    DeliveryAddressUIModel myAddress = widget.arguments.myAddress;
    viewmodel = context.read<IMyAddressViewModel>();
    addressController = TextEditingController();
    addressKey = GlobalKey<FormState>();
    phoneNumberController = TextEditingController();
    phoneNumberKey = GlobalKey<FormState>();
    fullNameController = TextEditingController();
    provinceController = TextEditingController();
    districtController = TextEditingController();
    wardController = TextEditingController();
    fullNameKey = GlobalKey<FormState>();
    provinceKey = GlobalKey<FormState>();
    districtKey = GlobalKey<FormState>();
    wardKey = GlobalKey<FormState>();
    addressController.text = myAddress.address;
    phoneNumberController.text = myAddress.phoneNumber;
    fullNameController.text = myAddress.fullName;
    Future.delayed(Duration.zero, () {
      viewmodel.init(
        nameProvince: myAddress.province,
        nameDistrict: myAddress.district,
        nameWard: myAddress.ward,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var myAddress = widget.arguments.myAddress;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.arguments.isNewAddress
              ? Strings.newAddress.tr
              : Strings.updateAddress.tr,
          style: TextStyleUtils.heading3.copyWith(
            color: ColorUtils.black86,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
        elevation: 1,
        toolbarHeight: 48.h,
        backgroundColor: ColorUtils.white,
        foregroundColor: ColorUtils.primaryBlackColor,
        actions: [
          TextButton(
            onPressed: () async {
              await _onSave(myAddress);
            },
            child: Text(
              Strings.save.tr,
              style: TextStyleUtils.titleSemiBold.copyWith(
                color: ColorUtils.blueIOS,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  BuildTextFormFieldWidget(
                    labelText: Strings.fullname.tr,
                    controller: fullNameController,
                    keyboardType: TextInputType.text,
                    onValidate: (value) {
                      return ValidateUtils.validateFullName(value!);
                    },
                    textInputAction: TextInputAction.done,
                    formkey: fullNameKey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BuildTextFormFieldWidget(
                    labelText: Strings.phoneNumer.tr,
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    onValidate: (value) {
                      return ValidateUtils.validatePhoneNumber(value!);
                    },
                    textInputAction: TextInputAction.done,
                    formkey: phoneNumberKey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Consumer<IMyAddressViewModel>(builder: (_, _vm, __) {
                    provinceController.text = _vm.currentProvince.name;
                    districtController.text = _vm.currentDistrict.name;
                    wardController.text = _vm.currentWard.name;
                    return Column(
                      children: [
                        BuildTextFormFieldWidget(
                          labelTextWithRequire: Strings.province.tr,
                          readOnly: true,
                          formkey: provinceKey,
                          onValidate: (value) {
                            return ValidateUtils.validateEmpty(value!);
                          },
                          onTap: () {
                            Get.toNamed(
                              MyRouter.choosenAddress,
                              arguments: SelectAddressArguments(
                                listOfAddress: _vm.listLocations,
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
                          formkey: districtKey,
                          onValidate: (value) {
                            return ValidateUtils.validateEmpty(value!);
                          },
                          onTap: () {
                            Get.toNamed(
                              MyRouter.choosenAddress,
                              arguments: SelectAddressArguments(
                                listOfAddress: _vm.currentDistrict.name == ''
                                    ? _vm.listLocations
                                    : _vm.currentProvince.districts!,
                                title: _vm.currentDistrict.name == ''
                                    ? Strings.province.tr
                                    : Strings.district.tr,
                                isDistrictFocused:
                                    _vm.currentDistrict.name != '',
                                isProvinceFocused:
                                    _vm.currentDistrict.name == '',
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
                          formkey: wardKey,
                          onValidate: (value) {
                            return ValidateUtils.validateEmpty(value!);
                          },
                          onTap: () {
                            Get.toNamed(
                              MyRouter.choosenAddress,
                              arguments: SelectAddressArguments(
                                listOfAddress: _vm.currentProvince.name == ''
                                    ? _vm.listLocations
                                    : _vm.currentDistrict.name == ''
                                        ? _vm.currentProvince.districts!
                                        : _vm.currentDistrict.wards!,
                                title: _vm.currentProvince.name == ''
                                    ? Strings.province.tr
                                    : _vm.currentDistrict.name == ''
                                        ? Strings.district.tr
                                        : Strings.ward.tr,
                                isWardFocused: _vm.currentDistrict.name != '' &&
                                    _vm.currentProvince.name != '',
                                isOrderStep: true,
                                isDistrictFocused:
                                    _vm.currentProvince.name == '',
                                isProvinceFocused:
                                    _vm.currentDistrict.name == '',
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
                      ],
                    );
                  }),
                  SizedBox(
                    height: 15.h,
                  ),
                  BuildTextFormFieldWidget(
                    labelText: Strings.address.tr,
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    onValidate: (value) {
                      return ValidateUtils.validateEmpty(value!);
                    },
                    textInputAction: TextInputAction.done,
                    formkey: addressKey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSave(DeliveryAddressUIModel myAddress) async {
    if (fullNameKey.currentState!.validate() &&
        phoneNumberKey.currentState!.validate() &&
        addressKey.currentState!.validate() &&
        districtKey.currentState!.validate() &&
        provinceKey.currentState!.validate() &&
        wardKey.currentState!.validate() &&
        viewmodel.currentWard.name != '' &&
        viewmodel.currentDistrict.name != '' &&
        viewmodel.currentProvince.name != '') {
      var myAddressInDb = locator<IDeliveryAddressService>()
          .findByDeliveryAddressId(myAddress.id);
      if (myAddressInDb != null) {
        myAddressInDb.fullName = fullNameController.text;
        myAddressInDb.phoneNumber = phoneNumberController.text;
        myAddressInDb.province = viewmodel.currentProvince.name;
        myAddressInDb.district = viewmodel.currentDistrict.name;
        myAddressInDb.ward = viewmodel.currentWard.name;
        myAddressInDb.address = addressController.text;
      } else {
        myAddressInDb = DeliveryAddressEntity(
          fullName: fullNameController.text,
          phoneNumber: phoneNumberController.text,
          province: viewmodel.currentProvince.name,
          district: viewmodel.currentDistrict.name,
          ward: viewmodel.currentWard.name,
          address: addressController.text,
        );
      }
      LoadingDialogUtils.showLoading();
      if (widget.arguments.isNewAddress) {
        await viewmodel.addAddress(myAddressInDb);
      } else {
        await viewmodel.updateAddress(myAddressInDb);
      }
      await viewmodel.getListLocation();
      LoadingDialogUtils.hideLoading();
      Get.back();
    }
  }
}
