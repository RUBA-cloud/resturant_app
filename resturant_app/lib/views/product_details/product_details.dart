import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/components/side_bar.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/views/product_details/cubit/product_details._cubit.dart';
import 'package:resturant_app/views/product_details/cubit/product_details_state.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductQuantityCubit(unitPrice: product.price),
      child: Scaffold(
        body: Stack(
          children: [
            /// BACKGROUND IMAGE
            Positioned.fill(
              child: Hero(
                tag: product.image,
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),

            /// TOP BAR
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleIcon(
                      context,
                      Icons.arrow_back,
                      onTap: () => Get.back(),
                    ),
                    _circleIcon(
                      context,
                      Icons.settings,
                      onTap: () => showBottomMenu(context),
                    ),
                  ],
                ),
              ),
            ),

            /// BOTTOM PANEL
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: BlocBuilder<ProductQuantityCubit, QuantityState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              langCode == "ar"
                                  ? product.nameAr
                                  : product.nameEn,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Naperville, Illinois',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            /// NUTRITION INFO
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _nutritionItem("198", "kcal"),
                                _nutritionItem("25.2", "proteins"),
                                _nutritionItem("13.8", "fats"),
                                _nutritionItem("23.7", "carbo"),
                              ],
                            ),
                            const SizedBox(height: 20),

                            /// DESCRIPTION
                            Text(
                              product.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 25),

                            /// BUY NOW BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added ${state.quantity} items',
                                      ),
                                    ),
                                  );
                                },
                                style: buttonStyle,

                                child: Text(
                                  "buy_now".tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(
    BuildContext context,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return CircleAvatar(
      // ignore: deprecated_member_use
      backgroundColor: Colors.white.withOpacity(0.85),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }

  Widget _nutritionItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: secondrycolor, fontSize: 12)),
      ],
    );
  }
}
