import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:aureus_group/src/common/enum/validation.dart';
import 'package:aureus_group/src/common/helper/common_util.dart';
import 'package:aureus_group/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:aureus_group/src/presentation/widgets/buttons/button_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/text_fields/text_form_field.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;
  final Function() sendEmail;
  const SignUpForm({
    required this.emailController,
    required this.passwordController,
    required this.password2Controller,
    required this.sendEmail,
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
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ConstColors.dark80)),
                    child: const Center(
                        child: BodyText.largeBold(
                      'Add\nPhoto',
                      textAlign: TextAlign.center,
                    )),
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
                TextFormFieldWidget.passwordWithLabel(
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
                ),
                SeparatorWidget.height20(),
                TextFormFieldWidget.passwordWithLabel(
                  'Re-Type Password',
                  'Re-Type Password',
                  isObscureText: state.isObscurePassword,
                  controller: password2Controller,
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
                ),
                SeparatorWidget.height20(),
                ButtonWidget.basicText('Create Account',
                    backgroundColor: ConstColors.orange, action: () {
                  if (!CommonUtil.falsyChecker(emailController.text) &&
                      !CommonUtil.falsyChecker(passwordController.text) &&
                      !CommonUtil.falsyChecker(password2Controller.text)) {
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
                    const BodyText.dflt("Already have an account?"),
                    SeparatorWidget.width8(),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const BodyText.dfltBold(
                          'Login',
                          color: ConstColors.orange,
                        ))
                  ],
                ),
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
