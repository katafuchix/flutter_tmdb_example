import 'package:flutter/material.dart';
import '../config/app_color.dart';

abstract class UtilText {
  static const TextStyle textStyle24 = TextStyle(
    color: AppColor.colorWhite,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle20No = TextStyle(
    color: AppColor.colorWhite,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle20 = TextStyle(
    color: AppColor.colorWhite,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle18No = TextStyle(
    color: AppColor.colorWhite,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle18 = TextStyle(
    color: AppColor.colorWhite,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle16 = TextStyle(
    color: AppColor.black300,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle12 = TextStyle(
    color: AppColor.colorWhite,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textStyle10 = TextStyle(
    color: AppColor.black300,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}
