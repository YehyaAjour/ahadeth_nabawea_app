

import 'package:ahadeth_nabawea_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: colorApp.blue2,
  ));
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          theme: ThemeData(
              primaryColor: colorApp.blue2,),
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          builder: (context, widget) {
            // Get.put(AuthController());
            return widget;
          },
          supportedLocales: const [
            Locale('ar', 'AE'),
          ],
          home: SplashScreen(),
        );
      },
    );
  }
}
