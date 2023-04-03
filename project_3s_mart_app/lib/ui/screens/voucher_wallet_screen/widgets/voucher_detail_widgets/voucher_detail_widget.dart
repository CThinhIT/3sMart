import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class VoucherDetail extends StatefulWidget {
  final String detail;
  const VoucherDetail({Key? key, required this.detail}) : super(key: key);

  @override
  State<VoucherDetail> createState() => _VoucherDetailState();
}

class _VoucherDetailState extends State<VoucherDetail> {
  bool _showMore = false;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 250.h,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${Strings.voucherDetails.tr}:",
              style: TextStyleUtils.title.copyWith(
                color: ColorUtils.black86,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              widget.detail,
              maxLines: _showMore ? null : 9,
              overflow:
                  _showMore ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyleUtils.body.copyWith(
                color: ColorUtils.black60,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: SizedBox(
                width: 115.w,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      // toggle the bool variable true or false
                      _showMore = !_showMore;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _showMore ? Strings.showLess.tr : Strings.showMore.tr,
                        style: TextStyleUtils.button.copyWith(
                          color: ColorUtils.black60,
                        ),
                      ),
                      Icon(
                        _showMore
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: ColorUtils.black86,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
