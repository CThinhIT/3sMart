import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_3s_mart_app/global/environment.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:provider/provider.dart';

import 'core/utils/color_utils.dart';
import 'global/locator.dart';
import 'global/my_router_observer.dart';
import 'global/providers.dart';
import 'global/router.dart';
import 'translation/app_translation.dart';
import 'ui/utils/navigation_utils.dart';

void main() {
  mainDelegate(Environment.dev);
}

Future<void> mainDelegate(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!(await Permission.contacts.request().isGranted)) {
    await [
      Permission.storage,
    ].request();
  }
  var storage = await getApplicationDocumentsDirectory();
  EnvironmentUtil.setEnvironment(env, storage);
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorUtils.primaryRedColor,
    ));
    return MultiProvider(
      providers: [...viewModelProviders],
      child: ScreenUtilInit(builder: () {
        return GetMaterialApp(
          title: Strings.appName,
          navigatorKey: NavigationUtils.navigatorKey,
          onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
          navigatorObservers: [MyRouteObserver()],
          initialRoute: MyRouter.splash,
          theme: ThemeData(
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'BeVietnam',
          ),
          debugShowCheckedModeBanner: false,

          /// Config translation
          translations: AppTranslation(),
          // TODO: get current locale from SettingViewModel
          locale: AppTranslation.getDefaultLocale(),
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
