import 'package:aureus_group/src/common/constants/routes.dart';
import 'package:aureus_group/src/common/router/jobbox_router.dart';
import 'package:aureus_group/src/presentation/effects/scrolls.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Routes.splash,
      onGenerateRoute: (settings) => JobBoxRouter.generateRoute(
        settings,
        const BouncingScrollBehavior(),
      ),
    );
  }
}
