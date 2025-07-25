import 'package:get/get.dart';
import 'package:resturant_app/views/auth/login.dart';
import 'package:resturant_app/views/home_page.dart';
// Import other screens as needed
// import 'package:resturant_app/views/onboarding/onboarding.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';

  // static const onboarding = '/onboarding';

  static final routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),

    // Add more routes here
    // GetPage(
    //   name: onboarding,
    //   page: () => OnboardingScreen(),
    // ),
  ];
}
