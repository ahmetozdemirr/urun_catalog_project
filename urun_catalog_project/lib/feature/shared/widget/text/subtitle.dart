import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/shared/text_style.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';

class SubTitleText extends StatelessWidget {
  final String value;
  final Color ?color;
  final double ?size;

  const SubTitleText(this.value, {this.color, this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: welcomeStyle.copyWith(
        color: color,
        fontSize: size ?? FontSizeValue.MEDIUM),
        
    );
  }
}