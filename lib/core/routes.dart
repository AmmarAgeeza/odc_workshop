import 'package:flutter/material.dart';
import 'package:odc_bootcamp/view/screens/home_layout/home_layout.dart';
import 'package:odc_bootcamp/view/screens/lectures_screen/lectures_screen.dart';
import 'package:odc_bootcamp/view/screens/login_screen/login_screen.dart';
import 'package:odc_bootcamp/view/screens/news_screen/news_screen.dart';
import 'package:odc_bootcamp/view/screens/settings_screen/settings_screen.dart';
import 'package:odc_bootcamp/view/screens/splash_screen/splash_screen.dart';
import 'package:odc_bootcamp/view/screens/support_screen/support_screen.dart';

import '../view/screens/sections_screen/sections_screen.dart';
import '../view/screens/signup_screen/signup_screen.dart';
import 'resources/strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String homeLayoutRoute = '/homeLayout';
  static const String newsRoute = '/news';
  static const String supportRoute = '/support';
  static const String sectionsRoute = '/sections';
  static const String settingsRoute = '/settings';
  static const String lecturesRoute = '/lectures';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.homeLayoutRoute:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case Routes.newsRoute:
        return MaterialPageRoute(builder: (_) => const NewsScreen());
      case Routes.sectionsRoute:
        return MaterialPageRoute(builder: (_) => const SectionsScreen());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.supportRoute:
        return MaterialPageRoute(builder: (_) => SupportScreen());
      case Routes.lecturesRoute:
        return MaterialPageRoute(builder: (_) => const LecturesScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
