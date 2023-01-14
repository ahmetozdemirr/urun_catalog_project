import 'package:flutter/material.dart';
import 'package:urun_catalog_project/feature/pages/home/view/home_pages.dart';
import 'package:urun_catalog_project/feature/pages/login/view/login_pages.dart';
import 'package:urun_catalog_project/feature/pages/register/view/register_pages.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
