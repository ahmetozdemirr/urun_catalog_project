import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key,
      required this.child,
      required this.onPress,
       this.color=UIHelper.kButtonColor})
      : super(key: key);
  final Widget child;
  final VoidCallback onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
         side: BorderSide.none,
         
        )
      ),
      onPressed: this.onPress, 
      child: this.child);
  }
}
