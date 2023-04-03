part of '../scan_screen.dart';

class _ScannerButtons extends StatelessWidget {
  const _ScannerButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IScanViewModel>(
      builder: (_, vm, __) => IgnorePointer( // ignore click on not scanning
        ignoring: !vm.isScanning,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ComposedButton(
              onPressed: vm.onOnOffFlashPressed,
              iconAsset: 'assets/images/ic_flash.svg',
              title: vm.isFlashOn ? Strings.flashlightOff.tr : Strings.flashlightOn.tr,
              backgroundColor: Colors.transparent,
            ),
            ComposedButton(
              onPressed: vm.onSwitchCameraPressed,
              iconAsset: 'assets/images/ic_switch_camera.svg',
              title: Strings.turnCamera.tr,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class ComposedButton extends StatelessWidget {
  final Function()? onPressed;
  final String iconAsset;
  final String title;
  final bool isSvgIcon;
  final Color backgroundColor;

  const ComposedButton({
    Key? key,
    required this.iconAsset,
    required this.title,
    this.onPressed,
    this.isSvgIcon = true,
    this.backgroundColor = ColorUtils.primaryRedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size.zero,
        padding: EdgeInsets.all(
          12.h,
        ),
        primary: backgroundColor,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          isSvgIcon
              ? SvgPicture.asset(
                  iconAsset,
                  color: Colors.white,
                  width: 24.r,
                  height: 24.r,
                )
              : Image.asset(iconAsset),
          SizedBox(width: 8.w),
          Text(title, style: TextStyleUtils.button),
        ],
      ),
    );
  }
}
