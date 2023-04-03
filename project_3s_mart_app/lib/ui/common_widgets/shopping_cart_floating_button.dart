import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:provider/provider.dart';

class ShoppingCartFloatingButton extends StatelessWidget {
  const ShoppingCartFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: Alignment(1.1.w, -1.1.h),
        children: [
          FloatingActionButton(
            backgroundColor: ColorUtils.primaryRedColor,
            onPressed: () {
              Get.toNamed(MyRouter.basket);
            },
            child: ShakeAnimWidget(
              child: SvgPicture.asset('assets/images/shopping_cart.svg'),
            ),
          ),
          Consumer<IBasketViewModel>(
            builder: (_, _viewModel, __) => _viewModel.basketItems.isNotEmpty
                ? Container(
                    child: Center(
                      child: Text(
                        '${_viewModel.basketQuantity}',
                        style: TextStyleUtils.productType.copyWith(
                          color: ColorUtils.black,
                          height: 1.1,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    constraints: BoxConstraints(
                      minWidth: 28.w,
                      minHeight: 21.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(41.r),
                      color: const Color(0xFFFFC01F),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5.r,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class ShakeAnimWidget extends StatefulWidget {
  final Widget child;
  final double shakeWidth = 12.w;

  ShakeAnimWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShakeAnimWidgetState();
}

class ShakeAnimWidgetState extends State<ShakeAnimWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  late final Animation<double> shakeHorizontalAdnim;
  late final IBasketViewModel basketViewmodel;

  @override
  void initState() {
    animController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    basketViewmodel = context.read<IBasketViewModel>()
      ..addListener(onBasketChanged);
    shakeHorizontalAdnim = Tween(begin: 0.0, end: widget.shakeWidth)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(animController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        }
      });
    super.initState();
  }

  /// Forward shake animation on basket changed only if widget is visible
  void onBasketChanged() {
    if (ModalRoute.of(context)!.isCurrent) {
      animController.forward();
    }
  }

  @override
  void dispose() {
    basketViewmodel.removeListener(onBasketChanged);
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shakeHorizontalAdnim,
      builder: (buildContext, child) {
        return Container(
          padding: EdgeInsets.only(
            left: shakeHorizontalAdnim.value + widget.shakeWidth,
            right: widget.shakeWidth - shakeHorizontalAdnim.value,
          ),
          child: widget.child,
        );
      },
    );
  }
}
