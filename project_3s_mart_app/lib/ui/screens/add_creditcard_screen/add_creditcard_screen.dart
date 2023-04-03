import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/payment_account_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/input_formater_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/utils/validate_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ipayment_account.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/screens/account_screen/widgets/build_text_edit_widget.dart';
import 'package:provider/provider.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  late final TextEditingController cardNoController;
  late final TextEditingController cardNameController;
  late final TextEditingController expiryController;
  late final TextEditingController cVVController;

  final GlobalKey<FormState> _formKeyCardNo = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyCardName = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyExpiryDate = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyCVV = GlobalKey<FormState>();

  final FocusNode _focusCardNo = FocusNode();
  final FocusNode _focusCardName = FocusNode();
  final FocusNode _focusExpiryDate = FocusNode();
  final FocusNode _focusCVV = FocusNode();

  @override
  void initState() {
    super.initState();
    cardNoController = TextEditingController();
    cardNameController = TextEditingController();
    expiryController = TextEditingController();
    cVVController = TextEditingController();

    _focusCardNo.addListener(_onFocusCardNo);
    _focusCardName.addListener(_onFocusCardName);
    _focusExpiryDate.addListener(_onFocusExpiryDate);
    _focusCVV.addListener(_onFocusCVV);
  }

  void _onFocusCardNo() {
    if (!_focusCardNo.hasFocus) {
      _formKeyCardNo.currentState?.validate();
    }
  }

  void _onFocusCardName() {
    if (!_focusCardName.hasFocus) {
      _formKeyCardName.currentState?.validate();
    }
  }

  void _onFocusExpiryDate() {
    if (!_focusExpiryDate.hasFocus) {
      _formKeyExpiryDate.currentState?.validate();
    }
  }

  void _onFocusCVV() {
    if (!_focusCVV.hasFocus) {
      _formKeyCVV.currentState?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.addCreditDebitCard.tr,
        ),
      ),
      backgroundColor: ColorUtils.backgroundColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBottom(
          onPressed: _onPressed,
          title: Strings.addCard.tr,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.addCardInformation.tr,
                    style: TextStyleUtils.title,
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/ic_mastercard.png',
                    width: 36.w,
                    height: 20.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    'assets/images/visa.svg',
                    width: 42.w,
                    height: 20.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    'assets/images/ic_jcb.png',
                    width: 26.w,
                    height: 20.h,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              BuildTextFormFieldWidget(
                formkey: _formKeyCardNo,
                controller: cardNoController,
                labelText: Strings.cardNo.tr,
                focusNode: _focusCardNo,
                hintText: Strings.enterCardNo.tr,
                keyboardType: const TextInputType.numberWithOptions(signed: true),
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberInputFormatter()
                ],
                onValidate: (value) =>
                    ValidateUtils.validateCardNumWithLuhnAlgorithm(value!),
              ),
              SizedBox(height: 16.h),
              BuildTextFormFieldWidget(
                formkey: _formKeyCardName,
                controller: cardNameController,
                textInputAction: TextInputAction.done,
                focusNode: _focusCardName,
                maxLength: 30,
                labelText: Strings.cardHolderName.tr,
                hintText: Strings.enterNameOnCard.tr,
                onValidate: (value) => ValidateUtils.validateFullName(value!),
              ),
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: BuildTextFormFieldWidget(
                      formkey: _formKeyExpiryDate,
                      focusNode: _focusExpiryDate,
                      controller: expiryController,
                      labelText: Strings.cardExpiryDate.tr,
                      hintText: Strings.enterExpiryDate.tr,
                      textInputAction: TextInputAction.done,
                      keyboardType: const TextInputType.numberWithOptions(signed: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardMonthInputFormatter(),
                      ],
                      onValidate: (value) =>
                          ValidateUtils.validateExpiryDate(value!),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 3,
                    child: BuildTextFormFieldWidget(
                      formkey: _formKeyCVV,
                      controller: cVVController,
                      focusNode: _focusCVV,
                      labelText: 'CVV',
                      hintText: Strings.enterCVV.tr,
                      textInputAction: TextInputAction.done,
                      keyboardType: const TextInputType.numberWithOptions(signed: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      maxLength: 3,
                      onValidate: (value) => ValidateUtils.validateCVV(value!),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  SvgPicture.asset('assets/images/ic_encrypted.svg'),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      Strings.msgVISA.tr,
                      style: TextStyleUtils.subHeading2.copyWith(
                        color: ColorUtils.black40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (_formKeyCardNo.currentState!.validate() &&
        _formKeyCardName.currentState!.validate() &&
        _formKeyExpiryDate.currentState!.validate() &&
        _formKeyCVV.currentState!.validate()) {
      var split = expiryController.text.split(RegExp(r'(\/)'));
      String cardNo =
          ValidateUtils.getCleanedNumber(cardNoController.text).trim();
      String cardName = cardNameController.text.trim();
      String month = split[0];
      String year = split[1];
      String cvv = cVVController.text;

      Provider.of<IPaymentAccountViewModel>(context, listen: false)
          .addPaymentAccount(
        PaymentAccountUIModel(
          cardNo: cardNo,
          cardName: cardName,
          paymentMethod: PaymentMethod.visaCardOrMastercard,
        ),
      );
      Get.back();
      Get.back();
    }
  }
}
