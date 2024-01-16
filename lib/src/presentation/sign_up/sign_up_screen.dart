import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:aureus_group/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:aureus_group/src/presentation/sign_up/widgets.dart/sign_up_form.dart';
import 'package:aureus_group/src/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const _SignUpScreen(),
    );
  }
}

class _SignUpScreen extends StatelessWidget {
  const _SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<_LoginScreen> createState() => __LoginScreenState();
}

class __LoginScreenState extends State<_LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets.customColorAppBarWithBackButton(context, '', ConstColors.basicBackground, ConstColors.dark80),
      backgroundColor: ConstColors.basicBackground,
      body: ListView(
        children: [
          SignUpForm(
            emailController: emailController,
            passwordController: passwordController,
            password2Controller: password2Controller,
            sendEmail: () {},
          ),
          SeparatorWidget.height50(),
          SeparatorWidget.height30(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By creating an account, you agree to Koko's",
                  style: TextStyleConstants.textStyleTextSmall.copyWith(
                    color: ConstColors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms of Use',
                        style: TextStyleConstants.textStyleTextSmall.copyWith(
                          color: ConstColors.orange,
                        )),
                    TextSpan(
                        text: 'And',
                        style: TextStyleConstants.textStyleTextSmall.copyWith(
                          color: ConstColors.black,
                        )),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyleConstants.textStyleTextSmall.copyWith(
                          color: ConstColors.orange,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
