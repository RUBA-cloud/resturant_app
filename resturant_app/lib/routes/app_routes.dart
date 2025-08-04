import 'package:get/get.dart';
import 'package:resturant_app/components/side_bar.dart';
import 'package:resturant_app/faviorate/faviorate_page.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/orders/orders_page.dart';
import 'package:resturant_app/views/aboutUs/about_us.dart';
import 'package:resturant_app/views/auth/forget_password.dart';
import 'package:resturant_app/views/auth/login/login.dart';
import 'package:resturant_app/views/auth/register/register.dart';
import 'package:resturant_app/views/cart/cart_page.dart';
import 'package:resturant_app/views/product_details/product_details.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const forgetPassword = '/forget_password';
  static const register = '/register';
  static const cart = '/cart';
  static const productDetails = '/product_details';
  static const faviorates = '/favorite';
  static const orders = '/orders';
  static const aboutUs = '/about_us';

  // static const onboarding = '/onboarding';

  static final routes = [
    GetPage(name: register, page: () => RegisterPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: forgetPassword, page: () => ForgetPassword()),
    GetPage(name: register, page: () => ForgetPassword()),
    GetPage(name: home, page: () => Sidebar()),
    GetPage(name: cart, page: () => CartPage()),
    GetPage(name: faviorates, page: () => FavioratePage()),
    GetPage(
      name: productDetails,
      page: () => ProductDetails(product: Get.arguments as ProductModel),
    ),
    GetPage(name: orders, page: () => OrdersPage()),
    GetPage(name: aboutUs, page: () => AboutUsPage(isAppBar: true)),

    // Add more routes here
    // GetPage(
    //   name: onboarding,
    //   page: () => OnboardingScreen(),
    // ),
  ];
}
