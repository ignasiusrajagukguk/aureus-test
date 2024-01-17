import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:aureus_group/src/common/enum/validation.dart';
import 'package:aureus_group/src/common/helper/common_util.dart';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:aureus_group/src/presentation/widgets/buttons/button_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/text_fields/text_form_field.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() sendEmail;
  final Function() navigateToSignUp;
  const LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.sendEmail,
    required this.navigateToSignUp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: ConstColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Heading.headingSize20(
                    'Sign In',
                    color: ConstColors.dark,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormFieldWidget.textWithLabelHeight40(
                  'Email',
                  'example@mail.com',
                  controller: emailController,
                  validator: (value) =>
                      (value!.trim().isEmpty) ? 'Email can not be empty' : null,
                  onChanged: (value) {},
                ),
                SeparatorWidget.height20(),
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  Log.info('Rebuild');
                  return TextFormFieldWidget.passwordWithLabel(
                    'Password',
                    'Password',
                    isObscureText: state.isObscurePassword,
                    controller: passwordController,
                    validator: (text) {
                      if (state.passwordValidation == Validation.invalid) {
                        return 'Format password incorrect';
                      }
                      return null;
                    },
                    onVisibillityTap: () {
                      var isObscurePassword = state.isObscurePassword;
                      context.read<LoginBloc>().add(
                            LoginSetPasswordVisibility(
                              isObscurePassword: !isObscurePassword,
                            ),
                          );
                    },
                  );
                }),
                SeparatorWidget.height20(),
                const Center(child: BodyText.dflt("Forgot Password?")),
                SeparatorWidget.height20(),
                ButtonWidget.basicText('Sign In',
                    backgroundColor: ConstColors.orange, action: () {
                  if (!CommonUtil.falsyChecker(emailController.text) &&
                      !CommonUtil.falsyChecker(passwordController.text)) {
                    context.read<LoginBloc>().add(LoginWithEmailPassword(
                        email: emailController.text,
                        password: passwordController.text));
                  } else {
                    warningDialog(context);
                  }
                  if (state.loginSuccessful) {
                    Navigator.pushNamed(
                      context,
                      Routes.dashboard,
                    );
                  }
                }, textColor: ConstColors.white),
                SeparatorWidget.height20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BodyText.dflt("Don't have an account?"),
                    SeparatorWidget.width8(),
                    InkWell(
                        onTap: navigateToSignUp,
                        child: const BodyText.dfltBold(
                          'Sign Up',
                          color: ConstColors.orange,
                        ))
                  ],
                ),
                SeparatorWidget.height20(),
              ],
            ),
          ),
        ),
      );
    });
  }

  warningDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          clipBehavior: Clip.hardEdge,
          content: ClipRRect(
            child: Container(
              constraints: const BoxConstraints(minHeight: 60, maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20(),
                  const Heading.headingSize20('Forms cannot be empty!'),
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20(),
                  const Icon(
                    Icons.close,
                    color: ConstColors.orange,
                    size: 150,
                  ),
                  SeparatorWidget.height20(),
                  SeparatorWidget.height20(),
                  const Text(
                    'You have to fill all the forms',
                    style: TextStyleConstants.textStyleTextLarge,
                    textAlign: TextAlign.center,
                  ),
                  SeparatorWidget.height20(),
                  ButtonWidget.basicText('Close',
                      backgroundColor: ConstColors.gray20, action: () {
                    Navigator.pop(context);
                  }),
                  SeparatorWidget.height20()
                ],
              ),
            ),
          ),
          titlePadding: const EdgeInsets.only(
            top: 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          insetPadding: const EdgeInsets.all(10),
          backgroundColor: ConstColors.white,
          contentPadding: const EdgeInsets.all(15),
        );
      },
    );
  }
}
