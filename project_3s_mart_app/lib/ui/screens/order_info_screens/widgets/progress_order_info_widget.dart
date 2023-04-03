import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class ProgressOrderInfoWidget extends StatelessWidget {
  final ProgressOrderInfo currentOrderStep;
  final bool isScanAndGoOrderProgress;

  const ProgressOrderInfoWidget({
    Key? key,
    required this.currentOrderStep,
    this.isScanAndGoOrderProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: isScanAndGoOrderProgress ? 56.h : 42.h,
        color: const Color(0xFFECECEC),
        child: isScanAndGoOrderProgress
            ? _ScanAndGoOrderSteps(currentOrderStep: currentOrderStep)
            : _OrderSteps(currentOrderStep: currentOrderStep));
  }
}

class _OrderSteps extends StatelessWidget {
  const _OrderSteps({
    Key? key,
    required this.currentOrderStep,
  }) : super(key: key);

  final ProgressOrderInfo currentOrderStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildProgressTitle(
          step: ProgressOrderInfo.address,
          setepNum: 1,
          name: Strings.address.tr,
          currentOrderStep: currentOrderStep,
        ),
        BuildProgressTitle(
          step: ProgressOrderInfo.orderConfirmation,
          setepNum: 2,
          name: Strings.orderConfirmation.tr,
          currentOrderStep: currentOrderStep,
        ),
        BuildProgressTitle(
          step: ProgressOrderInfo.payment,
          setepNum: 3,
          name: Strings.payment.tr,
          currentOrderStep: currentOrderStep,
        ),
        BuildProgressTitle(
          step: ProgressOrderInfo.completed,
          setepNum: 4,
          name: Strings.completed.tr,
          currentOrderStep: currentOrderStep,
        ),
      ],
    );
  }
}

class _ScanAndGoOrderSteps extends StatelessWidget {
  const _ScanAndGoOrderSteps({
    Key? key,
    required this.currentOrderStep,
  }) : super(key: key);

  final ProgressOrderInfo currentOrderStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: BuildProgressTitle(
            step: ProgressOrderInfo.deliveryMethod,
            setepNum: 1,
            name: Strings.deliveryMethod.tr,
            currentOrderStep: currentOrderStep,
          ),
        ),
        Flexible(
          child: BuildProgressTitle(
            step: ProgressOrderInfo.orderConfirmation,
            setepNum: 2,
            name: Strings.orderConfirmation.tr,
            currentOrderStep: currentOrderStep,
          ),
        ),
        Flexible(
          child: BuildProgressTitle(
            step: ProgressOrderInfo.payment,
            setepNum: 3,
            name: Strings.payment.tr,
            currentOrderStep: currentOrderStep,
          ),
        ),
        Flexible(
          child: BuildProgressTitle(
            step: ProgressOrderInfo.completed,
            setepNum: 4,
            name: Strings.completed.tr,
            currentOrderStep: currentOrderStep,
          ),
        ),
      ],
    );
  }
}

class BuildProgressTitle extends StatelessWidget {
  final ProgressOrderInfo step;
  final String name;
  final ProgressOrderInfo currentOrderStep;
  final int setepNum;

  const BuildProgressTitle({
    Key? key,
    required this.step,
    required this.setepNum,
    required this.name,
    required this.currentOrderStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool active = currentOrderStep.index >= step.index;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                active ? ColorUtils.primaryRedColor : const Color(0xFF979797),
          ),
          child: Center(
            child: Text(
              '$setepNum',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Flexible(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color:
                  active ? ColorUtils.primaryRedColor : const Color(0xFF979797),
            ),
            maxLines: 2,
            textWidthBasis: TextWidthBasis.longestLine,
          ),
        ),
      ],
    );
  }
}
