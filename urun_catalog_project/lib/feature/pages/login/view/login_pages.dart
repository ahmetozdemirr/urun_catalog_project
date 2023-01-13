import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_catalog_project/core/constant.dart';
import 'package:urun_catalog_project/feature/pages/login/service/login_service.dart';
import 'package:urun_catalog_project/feature/pages/login/viewmodel/login_cubit.dart';
import 'package:urun_catalog_project/feature/pages/register/view/register_pages.dart';
import 'package:urun_catalog_project/feature/shared/text_style.dart';
import 'package:urun_catalog_project/feature/shared/ui_helper.dart';
import 'package:urun_catalog_project/feature/shared/widget/button/elevated_button_widget.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/subtitle.dart';
import 'package:urun_catalog_project/feature/shared/widget/text/title.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseurl = "https://assign-api.piton.com.tr/api/rest/";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          formKey, emailController, passwordController,
          service: LoginService(Dio(BaseOptions(baseUrl: baseurl)))),
      child: BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        return buildScaffold(context, state);
      }, listener: (context, state) {
        if (state is LoginComplete) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegisterPage()));
        }
      }),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Form(
          autovalidateMode: state is LoginValidateState
              ? (state.isValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled)
              : AutovalidateMode.disabled,
          key: formKey,
          child: loginViewColumn(context)),
    ));
  }

  Column loginViewColumn(BuildContext context) {
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
        SubTitleText(welcomeText + " " + backText),
        TitleText(loginTitle),
        Spacer(),
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
        row(context),
        Spacer(),
        loginButtonFilled(context)

        //Spacer(),
      ],
    );
  }

  Container loginButtonFilled(BuildContext context) {
    return Container(
      height: 60,
      child: SizedBox.expand(child: loginButton(context)),
    );
  }

  ElevatedButtonWidget loginButton(BuildContext context) {
    return ElevatedButtonWidget(
      child: SubTitleText(
        loginText,
        color: UIHelper.kButtonTextColor,
      ),
      onPress: () {
        context.read<LoginCubit>().postUserModel();
      },
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
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => (value ?? '').length > 5 ? null : '6 dan kucuk',
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
}

bool checkState = false;
/*
Widget get loginViewColumn => Column(
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
        SubTitleText(welcomeText + " " + backText),
        TitleText(loginTitle),
        Spacer(),
        SubTitleText(
          emailText,
          color: UIHelper.kTextColor,
        ),
        emailTextField,
        SubTitleText(
          passwordText,
          color: UIHelper.kTextColor,
        ),
        passwordTextField,
        row,
        Spacer(),
        loginButtonFilled,
        //Spacer(),
      ],
    );
*/
/*
Widget get emailTextField => TextFormField(

  
      keyboardType: TextInputType.emailAddress,
      validator: (value) => (value ?? '').length > 5 ? null : '5 den kucuk',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: "john@gmail.com",
          hintStyle: mailTextInputHintTextStyle,
          filled: true,
          fillColor: UIHelper.decorationColor,
          enabledBorder: textInputDecoration,
          border: textInputDecoration),
    );

Widget get passwordTextField => TextFormField(
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => (value ?? '').length > 6 ? null : '6 dan kucuk',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: "john@gmail.com",
          hintStyle: mailTextInputHintTextStyle,
          filled: true,
          fillColor: UIHelper.decorationColor,
          enabledBorder: textInputDecoration,
          border: textInputDecoration),
    );
*/
Widget row(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 15,
        width: 15,
        child: Theme(
          data: ThemeData(unselectedWidgetColor: UIHelper.kPrimaryColor),
          child: Checkbox(value: checkState, onChanged: (value) {}),
        ),
      ),
      SizedBox(width: 6.5),
      TitleText(
        rememberText,
        size: 12,
        color: UIHelper.kPrimaryColor,
      ),
      Spacer(),
      TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: TitleText(
          registerText,
          size: 12,
          color: UIHelper.kPrimaryColor,
        ),
      )
    ],
  );
}
/*
Widget get loginButton => ElevatedButtonWidget(
    child: SubTitleText(
      loginText,
      color: UIHelper.kButtonTextColor,
    ),
    onPress: () {});

Widget get loginButtonFilled => Container(
      height: 60,
      child: SizedBox.expand(child: loginButton),
    );
*/