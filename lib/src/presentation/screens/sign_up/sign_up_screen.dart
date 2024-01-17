import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:aureus_group/src/presentation/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:aureus_group/src/presentation/screens/sign_up/widgets.dart/sign_up_form.dart';
import 'package:aureus_group/src/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpArguments {
  late List<CameraDescription> cameras;
  late CameraDescription camera;

  SignUpArguments({required this.camera, required this.cameras});
}

class SignUpScreen extends StatelessWidget {
  final SignUpArguments arguments;
  const SignUpScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: _SignUpScreen(
        arguments: arguments,
      ),
    );
  }
}

class _SignUpScreen extends StatefulWidget {
  final SignUpArguments arguments;
  const _SignUpScreen({required this.arguments});

  @override
  State<_SignUpScreen> createState() => __SignUpScreenState();
}

class __SignUpScreenState extends State<_SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
      appBar: AppBarWidgets.customColorAppBarWithBackButton(
          context, '', ConstColors.basicBackground, ConstColors.dark80),
      backgroundColor: ConstColors.basicBackground,
      body: ListView(
        children: [
          SignUpForm(
            emailController: emailController,
            passwordController: passwordController,
            password2Controller: password2Controller,
            sendEmail: () {},
            camera: widget.arguments.camera,
            cameras: widget.arguments.cameras,
            nameController: nameController,
            phoneNumberController: phoneNumberController,
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
