import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/components/side_bar.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/views/home/cart_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    int selectedCategory = 0;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeCubit()..loadHome(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is HomeLoaded) {
                final products = state.products;
                final categories = state.categories;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header & Search
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    Get.toNamed(AppRoutes.notifications),
                                icon: const Icon(Icons.notification_add),
                              ),
                              Text(
                                'app_name'.tr,
                                style: boldTextStyle.copyWith(fontSize: 22),
                              ),
                              IconButton(
                                onPressed: () => showBottomMenu(context),
                                icon: const Icon(Icons.settings),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'search_for_meals'.tr,
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: isDark
                                  ? Colors.grey[850]
                                  : Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 48,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                final cat = categories[index];
                                final selected = selectedCategory == index;
                                return ChoiceChip(
                                  label: Text(
                                    langCode == "ar" ? cat.nameAr : cat.nameEn,
                                  ),
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

                          const SizedBox(height: 28),
                          Text(
                            "flavor_of_week".tr,
                            style: boldTextStyle.copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 12),
                          FlavorCard(
                            product: products[0],
                            isArabic: langCode == "ar",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Product list (scrollable)
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "most_popular".tr,
                                style: boldTextStyle.copyWith(fontSize: 20),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("view_all".tr),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 180,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: products
                                  .where((p) => p.isPopular == true)
                                  .map(
                                    (product) => ProductCard(
                                      product: product,
                                      isArabic: langCode == "ar",
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            "most_selling".tr,
                            style: boldTextStyle.copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 12),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 3 / 4,
                            children: products
                                .map(
                                  (product) => ProductCard(
                                    product: product,
                                    isArabic: langCode == "ar",
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 80), // space above cart bar
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: CartBar(),
                    ),
                  ],
                );
              }

              return const Center(child: Text("Something went wrong"));
            },
          ),
        ),
      ),
    );
  }
}
