part of '../select_purchase_method_screen.dart';

class PurchaseMethodItem extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subTitle;
  final bool isEnabled;
  final Function() onPressed;
  final EdgeInsets? margin;
  final bool isScanAndGo;

  const PurchaseMethodItem({
    Key? key,
    required this.iconAsset,
    required this.title,
    required this.subTitle,
    required this.isEnabled,
    required this.onPressed,
    this.margin,
    this.isScanAndGo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RippleClickEffect(
        onPressed: isEnabled ? onPressed : null,
        color: ColorUtils.grey,
        borderRadius: BorderRadius.circular(4.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              Image.asset(
                iconAsset,
              ),
              SizedBox(width: 16.w),
              Expanded(
                              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                 
                  children: [
                    
                    Text(
                      title,
                      style: TextStyle(
                        color:
                            isEnabled ? ColorUtils.black86 : ColorUtils.black40,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subTitle,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: isScanAndGo ? 12.sp : 14.sp,
                        color: isEnabled
                            ? (isScanAndGo
                                ? ColorUtils.red
                                : ColorUtils.black86)
                            : ColorUtils.black40,
                      ),
                    ),
                  ],
                ),
              ),
              
              Image.asset(
                'assets/images/ic_right_arrow.png',
                color: isEnabled ? ColorUtils.black86 : ColorUtils.black40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
