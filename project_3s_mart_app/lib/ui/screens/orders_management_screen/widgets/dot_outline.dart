import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotOutline extends StatelessWidget {
  const DotOutline({
    Key? key,
    this.isOutLineBorderEnabled = true,
  }) : super(key: key);

  final bool isOutLineBorderEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (isOutLineBorderEnabled)
            BoxShadow(
                spreadRadius: 5,
                color: const Color(0xFF3771F4).withOpacity(0.2))
        ],
        shape: BoxShape.circle,
        color: const Color(0xFF3771F4),
      ),
      width: 16.w,
      height: 16.h,
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(55, 113, 244, 0.2),
      height: 50.h,
      width: 1.5.w,
    );
  }
}
