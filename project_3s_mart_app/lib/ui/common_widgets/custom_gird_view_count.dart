import 'package:flutter/material.dart';

class CustomGridViewCount extends StatelessWidget {
  const CustomGridViewCount({
    Key? key,
    required this.children,
    this.mainAxisSpacing = 0,
    this.crossAxisCount = 0,
  }) : super(key: key);
  final List<Widget> children;
  final double mainAxisSpacing;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i * crossAxisCount <= children.length; i++)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int j = 0; j <= crossAxisCount - 1; j++)
                    (i * crossAxisCount + j) < children.length
                        ? Expanded(
                            child:
                                Center(child: children[i * crossAxisCount + j]))
                        : const Expanded(
                            child: SizedBox.shrink(),
                          ),
                ],
              ),
              SizedBox(
                height: mainAxisSpacing,
              ),
            ],
          ),
      ],
    );
  }
}
