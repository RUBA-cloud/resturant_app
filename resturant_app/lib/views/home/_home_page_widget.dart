import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/models/category_model.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/views/home/cubit/home_cubit.dart';

// ignore: must_be_immutable
class HomeContent extends StatelessWidget {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final bool isArabic;
  int selectedCategory = 0;
  final HomeCubit homeCubit;

  HomeContent({
    super.key,
    required this.categories,
    required this.products,
    required this.isArabic,
    required this.homeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Text('app_name'.tr, style: boldTextStyle),
                        const SizedBox(height: 2),
                      ],
                    ),

                    // Locale Button
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: mainColor,
                      child: IconButton(
                        icon: Text(
                          isArabic ? "EN" : "AR",
                          style: boldTextStyle,
                        ),
                        onPressed: () {
                          if (isArabic) {
                            Get.updateLocale(const Locale('en', 'US'));
                          } else {
                            Get.updateLocale(const Locale('ar', 'SA'));
                          }
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
                          color: selected ? whiteColor : mainColor,
                        ),
                        selected: selected,
                        selectedColor: mainColor,
                        backgroundColor: whiteColor,
                        labelStyle: TextStyle(
                          color: selected ? whiteColor : mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onSelected: (_) {},
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),
                // Flavor of the week
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("delicious_flavor".tr, style: boldTextStyle),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
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
                          (product) => _ProductCard(
                            product: product,
                            isArabic: isArabic,
                          ),
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
                    style: boldTextStyle,
                  ),
                  const SizedBox(height: 6),
                  product.description.isNotEmpty
                      ? Chip(
                          label: Text(product.description),
                          labelStyle: TextStyle(color: Colors.black87),
                        )
                      : SizedBox(),
                  const SizedBox(height: 16),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: boldTextStyle,
                  ),
                ],
              ),
            ),
          ),
          // Cart Button
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () =>
                  Get.toNamed(AppRoutes.productDetails, arguments: product),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: whiteColor,
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
          color: Get.isDarkMode ? Colors.black45 : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
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
            Text("\${product.price.toStringAsFixed(2)}", style: boldTextStyle),
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
                    backgroundColor: whiteColor,
                    child: Text(
                      "2",
                      style: TextStyle(color: whiteColor, fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Cart".tr,
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "2 Items",
                    style: TextStyle(color: whiteColor, fontSize: 15),
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
                    foregroundColor: whiteColor,
                    radius: 16,
                    backgroundImage: AssetImage('asset/images/sandwish.png'),
                  ),
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: 16,
                    foregroundColor: whiteColor,

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
