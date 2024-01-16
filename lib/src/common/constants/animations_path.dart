const String _basePath = 'assets/animations';

class AnimationsPath {
  static Splash splash = const Splash();
  static Public public = const Public();
}

class Splash {
  const Splash();

  String get splashAnimation => '$_basePath/splash_animation.json';
}


class Public {
  const Public();

  String get emptyAnimation => '$_basePath/empty_assets.json';
}