import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:urun_catalog_project/core/constant.dart';
import 'package:urun_catalog_project/feature/pages/home/viewmodel/category_cubit.dart';
import 'package:urun_catalog_project/feature/shared/text_style.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/subtitle.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_catalog_project/model/category_models.dart';
import 'package:urun_catalog_project/service/categoryservice/category_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
          service: CategoryService(Dio(BaseOptions(baseUrl: baseurl)))),
      child: BlocConsumer<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return buildScaffold(context, state);
          },
          listener: (context, state) {}),
    );
  }

  Scaffold buildScaffold(BuildContext context, CategoryState state) {
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
          categoriesWidget(context),
          SizedBox(
            height: 20,
          ),
          _searchTextField()
        ],
      ),
    );
  }
}

/*
List categories = [
  "All",
  "Best Seller",
  "Classics",
  "Children",
  "Philosophy",
  "hello"
];*/
Widget categoriesWidget(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(height: 16),
        Wrap(
          spacing: 10,
          children: context.read<CategoryModel>().category!.map(
            (category) {
              return Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                height: 42,
                decoration: BoxDecoration(
                    color: UIHelper.decorationColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(child: SubTitleText(category.name.toString())),
              );
            },
          ).toList(),
        )
      ],
    ),
  );
}

TextFormField _searchTextField() {
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
