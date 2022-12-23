import 'package:flutter/cupertino.dart';
import 'package:userlist/data/arg/user_arg.dart';
import 'package:userlist/view/screen/details/details_screen.dart';
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
    case "/details":
      final arguments = settings.arguments as UserArg;
      page = CupertinoPageRoute(
          builder: (context) => DetailsScreen(
                id: arguments.id,
                fistName: arguments.fistName,
                lastName: arguments.lastName,
                email: arguments.email,
                avatar: arguments.avatar,
              ));
      break;
  }

  return page;
}
