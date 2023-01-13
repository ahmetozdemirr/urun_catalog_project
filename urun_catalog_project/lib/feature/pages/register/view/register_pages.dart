import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_catalog_project/core/constant.dart';
import 'package:urun_catalog_project/feature/pages/login/view/login_pages.dart';
import 'package:urun_catalog_project/feature/pages/register/service/register_service.dart';
import 'package:urun_catalog_project/feature/pages/register/viewmodel/register_cubit.dart';
import 'package:urun_catalog_project/feature/shared/text_style.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';
import 'package:urun_catalog_project/feature/shared/widget/button/elevated_button_widget.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/subtitle.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/title.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  final String baseurl = "https://assign-api.piton.com.tr/api/rest/";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          emailController, passwordController, nameController, formKey,
          service: RegisterService(Dio(BaseOptions(baseUrl: baseurl)))),
      child:
          BlocConsumer<RegisterCubit, RegisterState>(builder: (context, state) {
        return buildScaffold(context, state);
      }, listener: (context, state) {
        if (state is RegisterComplete) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }),
    );
  }

  Scaffold buildScaffold(BuildContext context, RegisterState state) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: 60,
          bottom: 40,
          right: 20,
          left:
              20), // const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Form(
          autovalidateMode: state is RegisterValidateState
              ? (state.isValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled)
              : AutovalidateMode.disabled,
          key: formKey,
          child: registerViewColumn(context)),
    ));
  }
}

bool checkState = false;

Widget registerViewColumn(BuildContext context) {
  return Column(
    //mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Center(
          child: Image.asset(
            "assets/images/logo.png",
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      Spacer(),
      SubTitleText(welcomeText),
      TitleText(registerTitle),
      Spacer(),
      SubTitleText(
        nameText,
        color: UIHelper.kTextColor,
      ),
      _nameTextField(),
      SubTitleText(
        emailText,
        color: UIHelper.kTextColor,
      ),
      _emailTextField(),
      SubTitleText(
        passwordText,
        color: UIHelper.kTextColor,
      ),
      _passwordTextField(),
      row,
      Spacer(),
      registerButtonFilled(context),
      //Spacer(),
    ],
  );
}

TextFormField _nameTextField() {
  return TextFormField(
    keyboardType: TextInputType.name,
    //validator: ,
    controller: nameController,
    decoration: InputDecoration(
        hintText: "john Doe",
        hintStyle: mailTextInputHintTextStyle,
        filled: true,
        fillColor: UIHelper.decorationColor,
        enabledBorder: textInputDecoration,
        border: textInputDecoration),
  );
}

TextFormField _emailTextField() {
  return TextFormField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (value) => (value ?? '').length > 5 ? null : '5 den kucuk',
    //autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
        hintText: "john@gmail.com",
        hintStyle: mailTextInputHintTextStyle,
        filled: true,
        fillColor: UIHelper.decorationColor,
        enabledBorder: textInputDecoration,
        border: textInputDecoration),
  );
}

TextFormField _passwordTextField() {
  return TextFormField(
    keyboardType: TextInputType.visiblePassword,
    controller: passwordController,
    //validator: ,
    decoration: InputDecoration(
        hintText: "john@gmail.com",
        hintStyle: mailTextInputHintTextStyle,
        filled: true,
        fillColor: UIHelper.decorationColor,
        enabledBorder: textInputDecoration,
        border: textInputDecoration),
  );
}

Widget get row => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: TitleText(
            loginText,
            size: 12,
            color: UIHelper.kPrimaryColor,
          ),
        )
      ],
    );

Widget registerButton(BuildContext context) {
  return ElevatedButtonWidget(
      child: SubTitleText(
        registerText,
        color: UIHelper.kButtonTextColor,
      ),
      onPress: () {
        context.read<RegisterCubit>().postRegisterModel();
      });
}

Widget registerButtonFilled(BuildContext context) {
  return Container(
    height: 60,
    child: SizedBox.expand(child: registerButton(context)),
  );
}
