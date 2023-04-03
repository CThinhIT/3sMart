import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/carousel_ui_model.dart';

abstract class ICarouselSliderViewModel implements ChangeNotifier {
  List<CarouselUIModel> get carouselList;
  late int currentPage;
  Future<bool> checkIsWellcome();
}

