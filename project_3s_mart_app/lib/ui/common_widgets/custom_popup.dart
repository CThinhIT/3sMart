import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final Widget child;
  final RRect highlights;

  const CustomPopup({
    Key? key,
    required this.child,
    required this.highlights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.srcOut,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  backgroundBlendMode: BlendMode.dstOut,
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: highlights.tlRadius,
                      topRight: highlights.trRadius,
                      bottomLeft: highlights.blRadius,
                      bottomRight: highlights.brRadius,
                    ),
                  ),
                  width: highlights.width,
                  height: highlights.height,
                ),
                left: highlights.left,
                top: highlights.top,
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
