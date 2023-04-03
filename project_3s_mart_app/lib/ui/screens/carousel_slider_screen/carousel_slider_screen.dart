import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icarousel_slider_viewmodel.dart';
import 'package:project_3s_mart_app/global/app_text.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/translation_text.dart';
import 'package:provider/provider.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  _CarouselSliderScreenState createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  late ICarouselSliderViewModel _viewModel;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    _viewModel = context.read<ICarouselSliderViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<ICarouselSliderViewModel>(
            builder: (_, __, ___) {
              return Image.asset(
                _viewModel.carouselList[_viewModel.currentPage].backgroundImage,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                height: 400.h,
                width: MediaQuery.of(context).size.width,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  AppText.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 40.sp,
                  ),
                ),
              ),
              const Spacer(),
              CarouselSlider(
                options: CarouselOptions(
                  height: 430.h,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (int index,
                      CarouselPageChangedReason carouselPageChangedReason) {
                    _viewModel.currentPage = index;
                  },
                ),
                items: _viewModel.carouselList
                    .map(
                      (item) => Center(
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    )
                    .toList(),
                carouselController: _controller,
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer<ICarouselSliderViewModel>(
                builder: (_, __, ___) {
                  return AutoSizeText(
                    _viewModel
                        .carouselList[_viewModel.currentPage].description[0].tr,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 15,
                    style: TextStyleUtils.largeHeading2.copyWith(
                      color: Colors.black,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              Consumer<ICarouselSliderViewModel>(
                builder: (_, __, ___) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 47.w,
                      right: 47.w,
                    ),
                    child: AutoSizeText(
                      _viewModel.carouselList[_viewModel.currentPage]
                          .description[1].tr,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 12,
                      style: TextStyleUtils.subHeading.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              Consumer<ICarouselSliderViewModel>(
                builder: (_, __, ___) {
                  return _viewModel.currentPage ==
                          _viewModel.carouselList.length - 1
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 44.h,
                          // ignore: deprecated_member_use
                          child: CustomButton(
                            height: 44.h,
                            onPressed: () {
                              Get.offNamed(MyRouter.login);
                            },
                            btnRadius: 10,
                            btnColor: ColorUtils.primaryRedColor,
                            textColor: Colors.white,
                            child: TranslationText(
                              Strings.login,
                              style: TextStyleUtils.button.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.offNamed(MyRouter.login);
                                },
                                child: TranslationText(
                                  Strings.lblSkip,
                                  style: TextStyleUtils.button.copyWith(
                                    color: ColorUtils.black40,
                                  ),
                                ),
                              ),
                              _buildDotLine(),
                              InkWell(
                                onTap: () {
                                  _controller.nextPage(
                                      curve: Curves.fastOutSlowIn);
                                },
                                child: TranslationText(
                                  Strings.lblGoNext,
                                  style: TextStyleUtils.button.copyWith(
                                    color: ColorUtils.primaryRedColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ],
      ),
    );
  }

  Row _buildDotLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...Iterable<int>.generate(_viewModel.carouselList.length).map(
          (int currentPage) => Padding(
            padding: const EdgeInsets.all(6),
            child: SizedBox(
              width: 8.r,
              height: 8.r,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _viewModel.currentPage >= currentPage
                      ? ColorUtils.primaryRedColor
                      : const Color(0xFF000000).withOpacity(0.38),
                ),
                child: Container(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
