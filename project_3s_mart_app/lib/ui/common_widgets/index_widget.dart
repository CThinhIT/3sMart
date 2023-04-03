import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class IndexWidget extends StatelessWidget {
  final int index;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets indexMargin;

  IndexWidget({
    Key? key,
    required this.index,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    EdgeInsets? indexMargin,
  })  : indexMargin = indexMargin ?? EdgeInsets.only(right: 4.w),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Container(
          margin: indexMargin,
          child: Text('$index.', style: TextStyleUtils.productType),
        ),
        ...children
      ],
    );
  }
}
