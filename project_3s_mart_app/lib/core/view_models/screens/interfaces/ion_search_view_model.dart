import 'package:flutter/material.dart';

abstract class IOnSearchViewModel implements ChangeNotifier {
  void onSearch(String value);
}