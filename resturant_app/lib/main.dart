import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/theme_data.dart';
import 'package:resturant_app/services/locale_services.dart';
import 'package:resturant_app/translations/translations.dart';
import 'package:resturant_app/views/auth/login.dart';

import '../../constants/exported_package.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final locale = await LocaleService.getSavedLocale();
  runApp(RecipeApp(locale: locale));
}

class RecipeApp extends StatelessWidget {
  final Locale locale;
  const RecipeApp({super.key, this.locale = const Locale('en', 'US')});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        theme: appTheme,
        getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        home: LoginPage(),
      ),
    );
  }
}
