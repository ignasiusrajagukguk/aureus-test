import 'dart:io';

import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:aureus_group/src/common/enum/validation.dart';
import 'package:aureus_group/src/common/helper/common_util.dart';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/presentation/screens/camera/camera_screen.dart';
import 'package:aureus_group/src/presentation/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:aureus_group/src/presentation/widgets/buttons/button_widget.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/text_fields/text_form_field.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController password2Controller;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final List<CameraDescription> cameras;
  final CameraDescription camera;
  final Function() sendEmail;
  const SignUpForm({
    required this.emailController,
    required this.passwordController,
    required this.password2Controller,
    required this.sendEmail,
    required this.cameras,
    required this.camera,
    required this.nameController,
    required this.phoneNumberController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      Log.info(state.file.path);
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
                  child: InkWell(
                    onTap: () {
                      showSourceDialog(
                        context,
                        updateImage: (file) {
                          context.read<SignUpBloc>().add(
                                SignUpUpdateImage(
                                  file: file,
                                ),
                              );
                          context.read<SignUpBloc>().add(
                                SignUpUploadImage(
                                  file: file,
                                ),
                              );
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: ConstColors.dark80)),
                        child: state.imageUrl != ''
                            ? Image.network(
                                state.imageUrl,
                                fit: BoxFit.cover,
                              )
                            : const Center(
                                child: BodyText.largeBold(
                                'Add\nPhoto',
                                textAlign: TextAlign.center,
                              )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormFieldWidget.textWithLabelHeight40(
                  'Name',
                  'Name',
                  controller: nameController,
                  validator: (value) =>
                      (value!.trim().isEmpty) ? 'Name can not be empty' : null,
                  onChanged: (value) {},
                ),
                SeparatorWidget.height20(),
                TextFormFieldWidget.textWithLabelHeight40(
                  'Phone Number',
                  'Phone Number',
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  validator: (value) => (value!.trim().isEmpty)
                      ? 'Phone Number can not be empty'
                      : null,
                  onChanged: (value) {},
                ),
                SeparatorWidget.height20(),
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
                    context.read<SignUpBloc>().add(
                          SignUpSetPasswordVisibility(
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
                    context.read<SignUpBloc>().add(
                          SignUpSetPasswordVisibility(
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
                    context.read<SignUpBloc>().add(SignUpWithEmailPassword(
                        email: emailController.text,
                        password: passwordController.text,
                        imageUrl: state.imageUrl,
                        name: nameController.text,
                        phone: phoneNumberController.text));
                  } else {
                    // warningDialog(context);
                  }
                  if (state.loginSuccessful) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Sign Up Successful'),
                      duration: Duration(milliseconds: 50),
                    ));
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.login,
                    );
                  }
                }, textColor: const Color.fromARGB(255, 102, 102, 102)),
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

  showSourceDialog(BuildContext context,
      {required Function(XFile file) updateImage}) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (context) => imagePicker(
        context,
        onTapCamera: () => ontapCamera(context, updateImage: updateImage),
        onTapGalery: () async {
          Navigator.pop(context);
          _onImageChange(ImageSource.gallery, context,
              updateImage: updateImage);
        },
      ),
    );
  }

  Widget imagePicker(
    BuildContext context, {
    Function()? onTapCamera,
    Function()? onTapGalery,
  }) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 150,
                  color: ConstColors.gray30,
                ),
              ),
              SeparatorWidget.height8(),
              ButtonWidget.basicWidget(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt_rounded,
                        color: ConstColors.white,
                        size: 18,
                      ),
                      SeparatorWidget.width10(),
                      const BodyText.large(
                        'Camera',
                        color: ConstColors.white,
                      )
                    ],
                  ),
                  backgroundColor: ConstColors.orange,
                  width: MediaQuery.of(context).size.width,
                  action: onTapCamera),
              SeparatorWidget.height8(),
              ButtonWidget.basicWidget(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        color: ConstColors.white,
                        size: 18,
                      ),
                      SeparatorWidget.width10(),
                      const BodyText.large(
                        'Gallery',
                        color: ConstColors.white,
                      )
                    ],
                  ),
                  backgroundColor: ConstColors.orange,
                  width: MediaQuery.of(context).size.width,
                  action: onTapGalery),
            ]),
      ),
    );
  }

  void ontapCamera(BuildContext context,
      {required Function(XFile file) updateImage}) async {
    Navigator.pop(context);
    Navigator.pushNamed(context, Routes.cameraScreen,
        arguments: CameraArguments(
          camera: camera,
          onTakePicture: (imageFile) async {
            updateImage(imageFile);
          },
          isWithVideo: false,
        ));
  }

  void _onImageChange(ImageSource source, BuildContext context,
      {required Function(XFile file) updateImage}) async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: source);
    if (imageFile != null) {
      updateImage(imageFile);
    } else {}
  }
}
