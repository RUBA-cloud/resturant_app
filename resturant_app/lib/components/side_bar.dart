import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/SharedPref.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/main_cubit.dart';

void showBottomMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  'john.doe@email.com',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SwitchListTile(
              title: Text('dark_mode'.tr),
              secondary: Icon(Icons.brightness_6),
              value: Get.isDarkMode,
              onChanged: (bool value) =>
                  context.read<MainCubit>().toggleTheme(),
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.language),
              title: Text('language'.tr),
              trailing: Text(langCode!),
              onTap: () => context.read<MainCubit>().changeLanguage(
                langCode == "ar" ? "en" : "ar",
                context,
              ),
            ),
            Divider(),
            const SizedBox(height: 24),
            _buildMenuItem(
              icon: Icons.info,
              title: 'about_us'.tr,
              onTap: () => Get.toNamed(AppRoutes.aboutUs),
            ),
            const Divider(),

            const SizedBox(height: 24),

            _buildMenuItem(
              icon: Icons.logout,
              title: 'logout'.tr,
              onTap: () {
                SharedPrefHelper.logout();
                Navigator.pop(context);
                Get.offAndToNamed(AppRoutes.login);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, size: 26, color: secondColor),
    title: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    onTap: onTap,

    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
    horizontalTitleGap: 12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
