import 'package:get/get.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/views/auth/forget_password.dart';
import 'package:resturant_app/views/auth/login.dart';
import 'package:resturant_app/views/auth/register.dart';
import 'package:resturant_app/views/cart/cart_page.dart';
import 'package:resturant_app/views/home/home_page.dart';
import 'package:resturant_app/views/product_details/product_details.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const forgetPassword = '/forget_password';
  static const register = '/register';
  static const cart = '/cart';
  static const productDetails = '/product_details';

  // static const onboarding = '/onboarding';

  static final routes = [
    GetPage(name: register, page: () => RegisterPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: forgetPassword, page: () => ForgetPassword()),
    GetPage(name: register, page: () => ForgetPassword()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: cart, page: () => CartPage()),
    GetPage(
      name: productDetails,
      page: () => ProductDetails(product: Get.arguments as ProductModel),
    ),

    // Add more routes here
    // GetPage(
    //   name: onboarding,
    //   page: () => OnboardingScreen(),
    // ),
  ];
}
