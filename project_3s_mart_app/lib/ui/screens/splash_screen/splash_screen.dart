import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/isplash_screen_view_model.dart';
import 'package:project_3s_mart_app/global/environment.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ISplashScreenViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = context.read<ISplashScreenViewModel>();

    Future.delayed(const Duration(seconds: 1), () async {
      await _viewModel.goToNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (EnvironmentUtil.currentEnv == Environment.prod) {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ));
    }
    return Scaffold(
      body: Container(
        color: ColorUtils.primaryRedColor,
        child: Center(
          child: Image.asset(
            'assets/images/Logo3SMart.png',
            width: 200.w,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
