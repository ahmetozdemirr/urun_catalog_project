import 'dart:html';

import 'package:flutter/material.dart';
import 'package:urun_catalog_project/core/constant.dart';
import 'package:urun_catalog_project/feature/shared/text_style.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';
import 'package:urun_catalog_project/feature/shared/widget/search/searchWidget.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/subtitle.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          width: 50,
          height: 32,
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        elevation: 1,
        title: Align(
            alignment: Alignment.centerRight, child: TitleText(catalogText)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          categoriesWidget(),
          SizedBox(
            height: 20,
          ),
          searchTextField(),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(categories[index].toString()),
                        SubTitleText("viewall"),
                      ],
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

List categories = [
  "All",
  "Best Seller",
  "Classics",
  "Children",
  "Philosophy",
  "hello"
];
Widget categoriesWidget() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(height: 16),
        Wrap(
          spacing: 10,
          children: categories.map(
            (category) {
              return Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                height: 42,
                decoration: BoxDecoration(
                    color: UIHelper.decorationColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(child: SubTitleText(category)),
              );
            },
          ).toList(),
        )
      ],
    ),
  );
}
