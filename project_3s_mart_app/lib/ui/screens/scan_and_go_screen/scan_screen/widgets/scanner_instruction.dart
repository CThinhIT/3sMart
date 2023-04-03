part of '../scan_screen.dart';

class _ScannerInstruction extends StatelessWidget {
  const _ScannerInstruction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32.w, 8.h, 32.w, 16.h),
      child: Text(
        Strings.pointCameraFrameAtBarcode.tr,
        style: TextStyleUtils.body.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
