import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/image_path.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:aureus_group/src/presentation/screens/login/widgets/login_form.dart';
import 'package:aureus_group/src/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

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
  final Permission _permission = Permission.camera;

  late List<CameraDescription> cameras;
  late CameraDescription camera;

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    List<CameraDescription> cameraList = await availableCameras();
    Log.colorGreen(cameraList);
    cameras = cameraList;
    camera = cameras.first;
    Log.colorGreen('Camera Initialized');
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  _checkPermissionStatus() async {
    final status = await _permission.status;
    if (!status.isGranted) {
      return await requestPermission(_permission);
    }
    if (status.isDenied) {
      Fluttertoast.showToast(
          msg: "Camera Permission Denied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: ConstColors.red50,
          textColor: ConstColors.white,
          fontSize: 16.0);
    }
  }

  Future<void> requestPermission(Permission permission) async {
    await permission.request();
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
            navigateToSignUp: () {
              Navigator.pushNamed(context, Routes.signUp,
                  arguments: SignUpArguments(camera: camera, cameras: cameras));
            },
          )
        ],
      ),
    );
  }
}
