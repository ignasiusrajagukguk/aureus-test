import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/image_path.dart';
import 'package:aureus_group/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:aureus_group/src/presentation/screens/login/widgets/login_form.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.basicBackground,
      body: ListView(
        children: [
          SeparatorWidget.height50(),
          SeparatorWidget.height50(),
          Image.asset(ImagePaths.jobboxLogo),
          SeparatorWidget.height50(),
          LoginForm(
            emailController: emailController,
            passwordController: passwordController,
            sendEmail: () {},
          )
        ],
      ),
    );
  }
}
