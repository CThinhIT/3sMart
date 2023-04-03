import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/utils/validate_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/add_delivery_address_screen/select_address_screen.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/widgets/build_text_edit_widget.dart';
import 'package:provider/provider.dart';

class AddNewDeliveryAddressScreen extends StatefulWidget {
  const AddNewDeliveryAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewDeliveryAddressScreen> createState() =>
      _AddNewDeliveryAddressScreenState();
}

class _AddNewDeliveryAddressScreenState
    extends State<AddNewDeliveryAddressScreen> {
  final AccountInfo _accountInfo = locator<GlobalData>().newAccount;
  late GlobalKey<FormState> fullNameKey, phoneNumberKey, addressKey;

  @override
  void initState() {
    fullNameKey = GlobalKey<FormState>();
    phoneNumberKey = GlobalKey<FormState>();
    addressKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.newAddress.tr,
          style: TextStyleUtils.heading3
              .copyWith(color: ColorUtils.primaryBlackColor),
        ),
        centerTitle: true,
        elevation: 1,
        toolbarHeight: 48.h,
        backgroundColor: ColorUtils.white,
        foregroundColor: ColorUtils.primaryBlackColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        actions: [
          TextButton(
            onPressed: () {
              fullNameKey.currentState!.validate();
              phoneNumberKey.currentState!.validate();
              addressKey.currentState!.validate();
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              BuildTextFormFieldWidget(
                labelText: Strings.fullname.tr,
                keyboardType: TextInputType.text,
                onValidate: (value) {
                  return ValidateUtils.validateFullName(value!);
                },
                initialValue: _accountInfo.userName,
                formkey: fullNameKey,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _accountInfo.userName = value;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              BuildTextFormFieldWidget(
                labelText: Strings.phoneNumer.tr,
                keyboardType: TextInputType.phone,
                formkey: phoneNumberKey,
                initialValue: _accountInfo.phoneNumber,
                onValidate: (value) {
                  return ValidateUtils.validatePhoneNumber(value!);
                },
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _accountInfo.phoneNumber = value;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              BuildTextFormFieldWidget(
                labelText: Strings.address.tr,
                readOnly: true,
                formkey: addressKey,
                onValidate: (value) {
                  return ValidateUtils.validateEmpty(value!);
                },
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20.sp,
                  color: ColorUtils.subTileButtonColor,
                ),
                onTap: () => Get.toNamed(
                  MyRouter.choosenAddress,
                  arguments: SelectAddressArguments(
                    listOfAddress:
                        Provider.of<IMyAddressViewModel>(context, listen: false)
                            .listLocations,
                    title: Strings.province.tr,
                    isProvinceFocused: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
