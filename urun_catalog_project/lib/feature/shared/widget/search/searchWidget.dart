import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/shared/text_style.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';

TextFormField searchTextField() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,

    //autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.format_list_bulleted_sharp),
        iconColor: UIHelper.hintTextColor,
        hintText: "Search",
        hintStyle: mailTextInputHintTextStyle,
        filled: true,
        fillColor: UIHelper.decorationColor,
        enabledBorder: textInputDecoration,
        border: textInputDecoration),
  );
}