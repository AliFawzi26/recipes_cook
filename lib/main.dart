import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recipes_cook/routes.dart';

import 'Core/class/MyTranslations.dart';
import 'Core/service/my_service.dart';
import 'Core/service/routes.dart';
import 'binding/intial_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MyService();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size(392, 852),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, child) {
      return GetMaterialApp(
        textDirection: TextDirection.rtl,

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: InitialBindings(),
        getPages: routes,
        initialRoute: Routes.SplashScreen,
        translations: MyTranslation(),
        locale: const Locale('ar', 'SA'),
        fallbackLocale: const Locale('en', 'US'),
      );
    });}
}
