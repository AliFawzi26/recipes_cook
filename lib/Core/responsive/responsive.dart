import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../const/app_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ResponsiveConfig {
  //auto
  static Widget setupResponsiveWrapper({required Widget child}) {
    return ResponsiveWrapper.builder(
       child,
      maxWidth: 2460,
      minWidth: 50,
      defaultScale: true,
      breakpoints: AppConstants.breakpoints,
      background: Container(color: const Color(0xFF5F5F5)),
    );
  }
  //manual
static  bool isMobile(BuildContext context){
    return ResponsiveWrapper .of(context).isSmallerThan(TABLET);}
 static  bool isTablet(BuildContext context){
    return ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)&&ResponsiveWrapper.of(context).isLargerThan(MOBILE);}
 static  bool isDestop(BuildContext context){
    return ResponsiveWrapper.of(context).isLargerThan(TABLET);}


}



