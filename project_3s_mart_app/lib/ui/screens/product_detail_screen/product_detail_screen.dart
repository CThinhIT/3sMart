import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/add_cart_anim/add_cart_anim_on_press_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/badge_of_basket.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_list.dart';
import 'package:project_3s_mart_app/ui/common_widgets/quantity_group_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/session.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
import 'package:provider/provider.dart';

part 'widgets/product_body.dart';
part 'widgets/product_description.dart';
part 'widgets/product_image.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductUIModel productUIModel;
  const ProductDetailScreen({
    Key? key,
    required this.productUIModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AddCartAnimUtils.productDetailScreenKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.productDetail.tr),
        titleTextStyle: TextStyleUtils.heading3.copyWith(
          color: ColorUtils.black,
        ),
        leading: const BackButton(
          color: ColorUtils.black,
        ),
        toolbarHeight: 48.h,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: BadgeOfBasket(
              key: AddCartAnimUtils.productDetailBasketBtnKey,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 6.h,
              color: ColorUtils.divider,
              height: 8,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                _ProductImage(
                  imageUrl: productUIModel.imageUrl,
                ),
                if (productUIModel.discount > 0)
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                    ),
                    child: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_discount.svg',
                            height: 34.h,
                            width: 34.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                              "-${productUIModel.discount}%",
                              style: TextStyleUtils.productType.copyWith(
                                color: ColorUtils.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Divider(
              thickness: 6.h,
              color: ColorUtils.divider,
            ),
            _ProductBody(
              product: productUIModel,
            ),
            Divider(
              thickness: 6.h,
              color: ColorUtils.divider,
              height: 8,
            ),
            _ProductDescription(
              description: productUIModel.description,
            ),
            Divider(
              thickness: 6.h,
              color: ColorUtils.divider,
            ),
            SectionWidget(
              title: Strings.suggestedComobo.tr,
              onViewAllPressed: () {
                Get.toNamed(MyRouter.productCategory);
              },
              child: ProductList(
                products: ProductUIModel.listSelingProductsDemo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
