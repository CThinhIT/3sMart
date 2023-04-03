import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class CustomDraggableScrollableSheet {
  final AnimationController controller;
  final String titleAppbar;
  final Widget childBody;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

  CustomDraggableScrollableSheet({
    required this.controller,
    required this.childBody,
    required this.titleAppbar,
    this.initialChildSize = 0.4,
    this.minChildSize = 0.2,
    this.maxChildSize = 0.6,
  });
}

class CustomDraggableScrollableSheetWidget extends StatefulWidget {
  final CustomDraggableScrollableSheet draggableScrollableSheet;
  const CustomDraggableScrollableSheetWidget({
    Key? key,
    required this.draggableScrollableSheet,
  }) : super(key: key);

  @override
  State<CustomDraggableScrollableSheetWidget> createState() =>
      _CustomDraggableScrollableSheetWidgetState();
}

class _CustomDraggableScrollableSheetWidgetState
    extends State<CustomDraggableScrollableSheetWidget>
    with SingleTickerProviderStateMixin {
  final Tween<Offset> _tween =
      Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SlideTransition(
        position: _tween.animate(widget.draggableScrollableSheet.controller),
        child: DraggableScrollableSheet(
          builder: (context, scrollcontroller) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              widget.draggableScrollableSheet.titleAppbar,
                              textAlign: TextAlign.center,
                              style: TextStyleUtils.body
                                  .copyWith(color: ColorUtils.primaryBlackColor),
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () {
                                widget.draggableScrollableSheet.controller
                                    .reverse();
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    widget.draggableScrollableSheet.childBody,
                  ],
                ),
              ),
            );
          },
          initialChildSize: widget.draggableScrollableSheet.initialChildSize,
          minChildSize: widget.draggableScrollableSheet.minChildSize,
          maxChildSize: widget.draggableScrollableSheet.maxChildSize,
        ),
      ),
    );
  }
}
