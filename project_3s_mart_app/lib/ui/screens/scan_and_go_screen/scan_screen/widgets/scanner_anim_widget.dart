
part of '../scan_screen.dart';

/// Widget that shows scanner animation
class _ScannerAnimWidget extends StatefulWidget {
  final double scannerSize;
  final double height;

  const _ScannerAnimWidget({
    Key? key,
    required this.scannerSize,
    required this.height,
  }) : super(key: key);

  @override
  State<_ScannerAnimWidget> createState() => _ScannerAnimWidgetState();
}

class _ScannerAnimWidgetState extends State<_ScannerAnimWidget>
    with TickerProviderStateMixin {
  /// Gradient colors to create [gradientWidget]
  var startGradientColor = const Color(0x00E51F26);
  var endGradientColor = const Color(0xFFE51F26);

  /// Controller to control up, down translating animation
  late final AnimationController animController;

  /// Anim that used to animate [gradientWidget] up, down
  late final Animation<double> translateYAnim;

  /// Gradient widget that is cached to reducing rebuilding while animating
  late Widget gradientWidget;

  @override
  void initState() {
    super.initState();

    buildGradientWidget();

    animController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    translateYAnim = Tween<double>(
      begin: 0, // begin Y
      end: widget.scannerSize - widget.height, // end Y
    ).animate(animController);

    animController
      ..repeat(reverse: true)
      ..addStatusListener(
        updateGradientWidgetOnAnimStatusChanged,
      );
  }

  void buildGradientWidget() {
    gradientWidget = Opacity(
      opacity: 0.68,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startGradientColor, endGradientColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  /// Swap [startGradientColor] and [startGradientColor]
  /// then rebuild [gradientWidget]
  void updateGradientWidgetOnAnimStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.reverse ||
        status == AnimationStatus.forward) {
      var tmp = startGradientColor;
      startGradientColor = endGradientColor;
      endGradientColor = tmp;
      buildGradientWidget();
    }
  }

  @override
  void dispose() {
    animController.dispose();
    animController.removeStatusListener(
      updateGradientWidgetOnAnimStatusChanged,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: translateYAnim,
      builder: (context, child) => Transform.translate(
        child: gradientWidget,
        offset: Offset(0, translateYAnim.value),
      ),
    );
  }
}
