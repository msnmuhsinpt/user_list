import 'package:flutter/cupertino.dart';
import 'package:userlist/view/screen/home/home_screen.dart';

import '../view/screen/splash/splash_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  Route page = CupertinoPageRoute(
    builder: (context) => const SplashScreen(),
  );
  switch (settings.name) {
    case "/splash":
      page = CupertinoPageRoute(builder: (context) => const SplashScreen());
      break;

    case "/home":
      page = CupertinoPageRoute(builder: (context) => const HomeScreen());
      break;
  }

  return page;
}
