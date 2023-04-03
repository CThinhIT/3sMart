import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/services/interfaces/iappstrore_service.dart';
import 'package:project_3s_mart_app/core/ui_models/carousel_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icarousel_slider_viewmodel.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class CarouselSliderViewModel extends ChangeNotifier
    implements ICarouselSliderViewModel {
  @override
  List<CarouselUIModel> get carouselList => [
        CarouselUIModel(
          image: 'assets/images/carousel_slider_1.png',
          backgroundImage: 'assets/images/Flash1_BG.png',
          description: [
            Strings.lblCarouselTitle1,
            Strings.lblDescriptionForCarouselTitle1,
          ],
        ),
        CarouselUIModel(
          image: 'assets/images/carousel_slider_2.png',
          backgroundImage: 'assets/images/Flash2_BG.png',
          description: [
            Strings.lblCarouselTitle2,
            Strings.lblDescriptionForCarouselTitle2,
          ],
        ),
        CarouselUIModel(
          image: 'assets/images/carousel_slider_3.png',
          backgroundImage: 'assets/images/Flash3_BG.png',
          description: [
            Strings.lblCarouselTitle3,
            Strings.lblDescriptionForCarouselTitle3,
          ],
        ),
      ];

  int _currentPage = 0;
  @override
  int get currentPage => _currentPage;
  @override
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  @override
  Future<bool> checkIsWellcome() async{
    var appStorageService = locator<IAppStorageService>();
    var appStorage = await appStorageService.getAppStorage();
    return appStorage.isWelcome;
  }
}
