import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/main_cubit.dart';
import 'package:resturant_app/translations/translations.dart';
import 'package:resturant_app/views/auth/login/login.dart';
import 'package:resturant_app/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 🔥 Initialize Firebase

  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (_) => MainCubit()..initializeApp(),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            final cubit = context.read<MainCubit>();
            final currentLocale = Locale(
              cubit.language,
              cubit.language == "ar" ? "SA" : "US",
            );
            final currentTheme = cubit.isDark
                ? ThemeData.dark()
                : ThemeData.light();

            return GetMaterialApp(
              theme: currentTheme,
              getPages: AppRoutes.routes,
              debugShowCheckedModeBanner: false,
              translations: AppTranslations(),
              locale: currentLocale,
              fallbackLocale: const Locale('en', 'US'),
              home: state is MainAuthenticated
                  ? HomePage()
                  : LoginPage(), // Simplified navigation
            );
          },
        ),
      ),
    );
  }
}
