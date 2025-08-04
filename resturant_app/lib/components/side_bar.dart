import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:resturant_app/components/side_bar_cubit.dart';
import 'package:resturant_app/constants/colors.dart';
import 'package:resturant_app/faviorate/faviorate_page.dart';
import 'package:resturant_app/orders/orders_page.dart';
import 'package:resturant_app/routes/app_routes.dart';
import 'package:resturant_app/settings/settings_page.dart';
import 'package:resturant_app/views/aboutUs/about_us.dart';
import 'package:resturant_app/views/home/home_page.dart';
import 'package:resturant_app/views/cart/cart_page.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final _controller = AwesomeDrawerBarController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'home'.tr, 'icon': Icons.home},
    {'title': 'cart'.tr, 'icon': Icons.shopping_cart},
    {'title': 'favorites'.tr, 'icon': Icons.favorite},
    {'title': 'about_us'.tr, 'icon': Icons.info},
    {'title': 'orders'.tr, 'icon': Icons.receipt_long},
    {'title': 'settings'.tr, 'icon': Icons.settings},
  ];

  final List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    const FavioratePage(),
    const AboutUsPage(isAppBar: false), // Replace with AboutUsPage()
    const OrdersPage(),
    const SettingsPage(isDark: false),
  ]; // Replace with OrdersPage()

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SidebarCubit(),
      child: BlocBuilder<SidebarCubit, int>(
        builder: (context, selectedIndex) {
          return AwesomeDrawerBar(
            controller: _controller,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
            borderRadius: 24.0,
            // ignore: deprecated_member_use
            backgroundColor: mainColor.withOpacity(0.95),
            menuScreen: _buildMenu(context, selectedIndex),
            mainScreen: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: mainColor,
                leading: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    _controller.toggle!();
                  },
                ),
                title: Text(
                  menuItems[selectedIndex]['title'],
                  style: const TextStyle(color: whiteColor),
                ),
              ),
              body: pages[selectedIndex],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenu(BuildContext context, int selectedIndex) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [mainColor, secondColor, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) {
                    final item = menuItems[index];
                    return ListTile(
                      leading: Icon(item['icon'], color: whiteColor),
                      title: Text(
                        item['title'],
                        style: const TextStyle(color: whiteColor),
                      ),
                      selected: selectedIndex == index,
                      selectedTileColor: Colors.white24,
                      onTap: () =>
                          context.read<SidebarCubit>().selectIndex(index),
                    );
                  },
                ),
              ),
              const Divider(color: Colors.white54),
              ListTile(
                leading: CircleAvatar(radius: 16, child: Icon(Icons.person)),
                title: Text(
                  'logout'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () => Get.toNamed(AppRoutes.login),

                // logout logic here
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
