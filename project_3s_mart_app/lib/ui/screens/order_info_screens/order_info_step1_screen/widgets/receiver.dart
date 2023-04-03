part of '../order_info_step1_screen.dart';

class _BuildReceiver extends StatelessWidget {
  final TextEditingController fullNameController;
  final FocusNode fullNameFocus;
  final GlobalKey<FormState> fullNameKey;

  final TextEditingController phoneNumberController;
  final FocusNode phoneNumberFocus;
  final GlobalKey<FormState> phoneNumberKey;
  const _BuildReceiver({
    Key? key,
    required this.fullNameController,
    required this.fullNameFocus,
    required this.fullNameKey,
    required this.phoneNumberController,
    required this.phoneNumberFocus,
    required this.phoneNumberKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.receiver.tr,
            style: TextStyleUtils.title.copyWith(
              color: ColorUtils.primaryBlackColor,
            ),
          ),
          SizedBox(height: 16.h),
          BuildTextFormFieldWidget(
            onChangedForm: () =>
                viewmodel.isValidateName = fullNameKey.currentState!.validate(),
            hintText: Strings.enterRecipientName.tr,
            controller: fullNameController,
            focusNode: fullNameFocus,
            onCompleted: () {
              fullNameFocus.unfocus();
              FocusScope.of(context).requestFocus(phoneNumberFocus);
            },
            onValidate: (value) {
              return ValidateUtils.validateFullName(value!);
            },
            formkey: fullNameKey,
            onChanged: (value) {
              viewmodel.fullName = value;
            },
            labelText: Strings.recipientName.tr,
          ),
          SizedBox(
            height: 16.h,
          ),
          BuildTextFormFieldWidget(
            onChangedForm: () => viewmodel.isValidatePhoneNumber =
                phoneNumberKey.currentState!.validate(),
            hintText: Strings.enterYourphoneNumer.tr,
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            focusNode: phoneNumberFocus,
            onCompleted: () {
              phoneNumberFocus.unfocus();
            },
            onValidate: (value) {
              return ValidateUtils.validatePhoneNumber(value!);
            },
            textInputAction: TextInputAction.done,
            formkey: phoneNumberKey,
            onChanged: (value) {
              viewmodel.phoneNumber = value;
            },
            labelText: Strings.phoneNumber2.tr,
          )
        ],
      ),
    );
  }
}
