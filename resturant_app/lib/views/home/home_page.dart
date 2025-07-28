import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/constants/colors.dart';
import 'package:resturant_app/routes/app_routes.dart';
import 'package:resturant_app/views/home/cubit/home_cubit.dart';
import 'package:resturant_app/views/home/cubit/home_state.dart';
import 'package:resturant_app/models/category_model.dart';
import 'package:resturant_app/models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return BlocProvider(
      create: (context) => HomeCubit()..loadHome(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final cubit = context.read<HomeCubit>();
          final categories = cubit.categories;
          final products = cubit.products;

          return _HomeContent(
            categories: categories,
            products: products,
            isArabic: isArabic,
          );
        },
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final bool isArabic;
  const _HomeContent({
    required this.categories,
    required this.products,
    required this.isArabic,
  });

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final isArabic = widget.isArabic;
    final categories = widget.categories;
    final products = widget.products;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Avatar & Locale Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'app_name'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isArabic ? "كوكب أفضل" : "better planet",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  // Locale Button
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: secondrycolor,
                    child: IconButton(
                      icon: Text(
                        isArabic ? "EN" : "AR",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (isArabic) {
                          Get.updateLocale(const Locale('en', 'US'));
                        } else {
                          Get.updateLocale(const Locale('ar', 'SA'));
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Category Chips
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final selected = selectedCategory == index;
                    return ChoiceChip(
                      label: Text(isArabic ? cat.nameAr : cat.nameEn),
                      avatar: Icon(
                        cat.icon,
                        size: 18,
                        color: selected ? Colors.white : mainColor,
                      ),
                      selected: selected,
                      selectedColor: mainColor,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Flavor of the week
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isArabic ? "نكهة الأسبوع" : "Flavor of the week",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black38,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Ice Cream Card (first product of selected category or first product)
              _FlavorCard(
                product: _getFeaturedProduct(
                  categories,
                  products,
                  selectedCategory,
                ),
                isArabic: isArabic,
              ),
              const Spacer(),
              // Product List (filtered by category)
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: products
                      .where(
                        (p) =>
                            selectedCategory == 0 ||
                            p.categoryId == categories[selectedCategory].id,
                      )
                      .map(
                        (product) =>
                            _ProductCard(product: product, isArabic: isArabic),
                      )
                      .toList(),
                ),
              ),
              const Spacer(),
              // Bottom Cart Bar
              _CartBar(),
            ],
          ),
        ),
      ),
    );
  }

  ProductModel _getFeaturedProduct(
    List<CategoryModel> categories,
    List<ProductModel> products,
    int selectedCategory,
  ) {
    final filtered = products
        .where(
          (p) =>
              selectedCategory == 0 ||
              p.categoryId == categories[selectedCategory].id,
        )
        .toList();
    return filtered.isNotEmpty ? filtered.first : products.first;
  }
}

class _FlavorCard extends StatelessWidget {
  final ProductModel product;
  final bool isArabic;
  const _FlavorCard({required this.product, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Ice Cream Image
          Expanded(child: Image.asset(product.image, fit: BoxFit.fitHeight)),
          // Texts
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabic ? product.nameAr : product.nameEn,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Chip(
                    label: Text(
                      product.description.isNotEmpty
                          ? product.description
                          : "Delicious flavor",
                    ),
                    backgroundColor: const Color(0xFFE7F3E9),
                    labelStyle: const TextStyle(color: Colors.black54),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Cart Button
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: secondrycolor,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                elevation: 0,
              ),
              onPressed: () =>
                  Get.toNamed(AppRoutes.productDetails, arguments: product),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isArabic;
  const _ProductCard({required this.product, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.productDetails, arguments: product),
      child: Container(
        width: 110,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                product.image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isArabic ? product.nameAr : product.nameEn,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            Text(
              "\${product.price.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.cart),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: (mainColor),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Cart Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "2 Items",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
            // Cart Images (example)
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white.withOpacity(0.5),
                    radius: 16,
                    backgroundImage: AssetImage('asset/images/sandwish.png'),
                  ),
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: 16,
                    foregroundColor: Colors.white.withOpacity(0.5),

                    backgroundImage: AssetImage('asset/images/pasta3.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
