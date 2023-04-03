// ignore: use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

// ignore: use_key_in_widget_constructors
class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    this.onTap,
    this.readOnly = false,
    this.width,
  }) : super(key: key);

  final _textController = TextEditingController();
  final VoidCallback? onTap;
  final bool readOnly;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: width ?? 255.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorUtils.greyLight,
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        controller: _textController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            gapPadding: 0,
          ),
          contentPadding: EdgeInsets.only(
            right: 14.w,
            left: 10.w,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 10.w,
            ),
            child: Icon(
              CupertinoIcons.search,
              size: 17.r,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            maxWidth: 40.w,
            maxHeight: 24.h,
          ),
          hintText: Strings.hintSearch.tr,
          hintStyle: TextStyleUtils.subHeading.copyWith(
            color: ColorUtils.black60,
          ),
        ),
        style: TextStyleUtils.subHeading,
      ),
    );
  }
}
