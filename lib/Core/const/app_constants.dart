
import 'package:responsive_framework/responsive_framework.dart';




class AppConstants {
  AppConstants._();
  static List<ResponsiveBreakpoint> breakpoints = const [
    ResponsiveBreakpoint.resize(450, name: MOBILE),
    ResponsiveBreakpoint.autoScale(800, name: TABLET),
    ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
    ResponsiveBreakpoint.autoScale(1200, name: 'LARGE_DESKTOP'),
  ];
}




