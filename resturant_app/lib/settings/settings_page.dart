import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/settings/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  final bool isDark;

  // ignore: use_super_parameters
  const SettingsPage({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          final isDark = state.isDark;
          final langCode = state.locale.languageCode;

          return Scaffold(
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildHeader(context, isDark),
                const SizedBox(height: 24),

                SwitchListTile(
                  title: Text('dark_mode'.tr),
                  secondary: Icon(
                    Icons.brightness_6,
                  ),
                  value: isDark,
                  onChanged: (bool value) => cubit.toggleTheme(context),
                ),

                ListTile(
                  leading: Icon(
                    Icons.language,
                  ),
                  title: Text('language'.tr),
                  trailing: Text(langCode),
                  onTap: () => cubit.changeLanguage(Get.locale!, context),
                ),

        

                ListTile(
                  leading: Icon(
                    Icons.info,
                  ),
                  title: Text('about_us'.tr),
                  onTap: () => Get.toNamed(AppRoutes.aboutUs),
                ),

                const SizedBox(height: 16),

                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text('logout'.tr),
                  onTap: () => cubit.logout(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/user.jpg'),
        ),
        const SizedBox(height: 12),
        Text(
          'Jhoan Deo',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'jhoandeo@gmail.com',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
          ),
        ),
      ],
    );
  }

  Widget buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8, top: 16),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white70 : Colors.black54,
          fontSize: 13,
        ),
      ),
    );
  }
}
