import 'dart:ui';

import 'package:flutter/material.dart';

/// Widget that will be animated to create add cart animation
class AddCartAnimOverlayWidget extends StatefulWidget {
  final GlobalKey screenKey;
  final Offset startPosition;
  final Offset endPosition;
  final Widget child;
  final Function animationStatusCallback;
  final int durationInMilis;
  final double controlRatio;

  // ignore: use_key_in_widget_constructors
  const AddCartAnimOverlayWidget({
    required this.screenKey,
    required this.startPosition,
    required this.endPosition,
    required this.child,
    required this.animationStatusCallback,
    this.durationInMilis = 150,
    this.controlRatio = 1,
  });

  @override
  State<StatefulWidget> createState() {
    return AddCartAnimOverlayWidgetState();
  }
}

class AddCartAnimOverlayWidgetState extends State<AddCartAnimOverlayWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late PathMetric _animatePathMetric;

  @override
  void initState() {
    super.initState();
    setupAnimation();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _animController.forward();
    });
  }

  @override
  void dispose() {
    if (!_animController.isCompleted) {
      _animController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (_, __) {
        double animValue = _animController.value;
        Tangent tangent = _animatePathMetric.getTangentForOffset(animValue)!;
        var left = tangent.position.dx;
        var top = tangent.position.dy;
        return Positioned(
          left: left,
          top: top,
          child: widget.child,
        );
      },
    );
  }

  void setupAnimation() {
    Path path = computeAnimationPath();
    PathMetrics pm = path.computeMetrics();
    _animatePathMetric = pm.elementAt(0);
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilis),
      upperBound: _animatePathMetric.length,
    )..addStatusListener((status) {
        widget.animationStatusCallback(status);
        if (status == AnimationStatus.completed) {
          _animController.stop();
          _animController.dispose();
        }
      });
  }

  Path computeAnimationPath() {
    double controlPointX = computeControlPointX();
    Path path = Path();
    path.moveTo(widget.startPosition.dx, widget.startPosition.dy);
    path.quadraticBezierTo(controlPointX, widget.startPosition.dy,
        widget.endPosition.dx, widget.endPosition.dy);
    return path;
  }

  // Make sure control-point'x is between startDx and endDx;
  // and performed like Bezier
  double computeControlPointX() {
    double startX = widget.startPosition.dx;
    double endX = widget.endPosition.dx;
    double largeX = startX > endX ? startX : endX;
    double smallX = startX < endX ? startX : endX;
    double controlX = largeX / widget.controlRatio;
    if (controlX < smallX) {
      controlX = ((largeX - smallX) / widget.controlRatio) + smallX;
    }
    return controlX;
  }
}
