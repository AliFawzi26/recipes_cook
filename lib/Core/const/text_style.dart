import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class FontStyles {
  static var splachstyle = TextStyle  (
    fontSize: 34,
  fontWeight: FontWeight.bold,
  color: ColorManger.oran,
  );
 static const tabBar = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
 
static var textalr= TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
static  var exstyle= TextStyle(color: ColorManger.red, fontSize: 14.sp);
  static  var phstyle= TextStyle( fontSize: 14.sp);
static var Mstyle= TextStyle(fontSize: 14.sp, color:ColorManger.GA4);
static var lstyle= TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorManger.P,);

  static final InputDecoration searchDecoration = InputDecoration(
    hintText: "ابحث عن الوصفات...",
    hintStyle: TextStyle(fontSize: 14, color: ColorManger.GA2),
    prefixIcon: Icon(Icons.search, color: ColorManger.GA2),
    border: InputBorder.none,
  );



}
