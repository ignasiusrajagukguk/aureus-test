import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/presentation/screens/Dashboard/dashboard.dart';
import 'package:aureus_group/src/presentation/screens/apply_screen/apply_screen.dart';
import 'package:aureus_group/src/presentation/screens/login/login_screen.dart';
import 'package:aureus_group/src/presentation/screens/splash/splash_screen.dart';
import 'package:aureus_group/src/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
class JobBoxRouter {
  static Route generateRoute(
      RouteSettings routeSettings, ScrollBehavior scrollBehavior) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        return ScrollConfiguration(
          behavior: scrollBehavior,
          child: _getScreen(
            settings: routeSettings,
          ),
        );
      },
    );
  }

  static Widget _getScreen({required RouteSettings settings}) {
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return const SplashScreen();
      case Routes.login:
        return const LoginScreen();
      case Routes.dashboard:
        return const DashboardScreen();
      case Routes.signUp:
        return const SignUpScreen();
      case Routes.applyScreen:
        return const ApplyScreen();
      default:
        return Container();
    }
  }
}
