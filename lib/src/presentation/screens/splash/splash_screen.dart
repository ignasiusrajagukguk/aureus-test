import 'package:aureus_group/src/common/constants/animations_path.dart';
import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/image_path.dart';
import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.pushReplacementNamed(context, Routes.login,));
        
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
             Align(
                alignment: const Alignment(0, -0.4),
                child: Image.asset(ImagePaths.jobboxLogo,)),
            Align(
              alignment: Alignment.center,
              child: Lottie.asset(AnimationsPath.splash.splashAnimation,
                  width: 100),
            ),
            const Align(
                alignment: Alignment(0, 0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BodyText.size13Regular(
                      'Test Case By Ignasius',
                      color: ConstColors.orange,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
