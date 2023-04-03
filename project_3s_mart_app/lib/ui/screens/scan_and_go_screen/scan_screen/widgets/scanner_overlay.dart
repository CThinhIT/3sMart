part of '../scan_screen.dart';

/// Widget that draws an overlay view for [_Scanner]
/// The overlay includes cornors, border, center plus sign and scan animation
class _ScannerOverlay extends StatelessWidget {
  final double scannerSize;
  const _ScannerOverlay({Key? key, required this.scannerSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _ScannerOverlayPainter())),
          Selector<IScanViewModel, bool>(
            selector: (_, vm) => vm.isScanning,
            builder: (_, isScanning, __) => isScanning
                ? _ScannerAnimWidget(scannerSize: scannerSize, height: 96.h)
                : const SizedBox.shrink(),
          ),
          Positioned(
            child: const _ScannerButtons(),
            bottom: 8.h,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
