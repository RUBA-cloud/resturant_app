import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/routes/app_routes.dart';
import 'package:resturant_app/translations/translations.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe App',

      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image background fill
          Positioned.fill(
            child: Image.asset(
              'asset/images/background2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Text
          Positioned(
            left: 32,
            right: 32,
            top: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'learn_quick'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'recipes'.tr,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Skip Button
          Positioned(
            left: 24,
            bottom: 24,
            child: TextButton(
              onPressed: () {
                // // Change language for demo
                // if (Get.locale?.languageCode == 'en') {
                //   Get.updateLocale(const Locale('ar', 'SA'));
                // } else {
                //   Get.updateLocale(const Locale('en', 'US'));
                // }
                Get.toNamed(AppRoutes.home);
              },
              child: Text(
                'skip'.tr,
                style: const TextStyle(fontSize: 16, color: Colors.pink),
              ),
            ),
          ),
          // ... rest of your widgets ...
        ],
      ),
    );
  }
}
