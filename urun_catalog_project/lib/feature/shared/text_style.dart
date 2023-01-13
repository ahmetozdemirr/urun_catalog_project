import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:urun_catalog_project/feature/shared/ui_helper.dart';

final welcomeStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Manrope',
    color: UIHelper.kSubTitleColor);
final titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Manrope',
    color: UIHelper.kTextColor);
final mailTextInputHintTextStyle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, color: UIHelper.hintTextColor);

final textInputDecoration = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: UIHelper.decorationColor,
    ),
    borderRadius: BorderRadius.circular(4));
/*
final urunTheme = ThemeData(
  fontFamily: "Manrope",
  textTheme: TextTheme(
    subtitle1:TextStyle(
      fontSize: 16,fontWeight: FontWeight.w600,
    ) 
  )
);
*/