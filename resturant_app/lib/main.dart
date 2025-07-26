import 'package:resturant_app/translations/translations.dart';
import 'package:resturant_app/views/auth/login.dart';

import '../../constants/exported_package.dart';

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
      home: LoginPage(),
    );
  }
}
