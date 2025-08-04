import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/views/product_details/cubit/product_details._cubit.dart';
import 'package:resturant_app/views/product_details/cubit/product_details_state.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel? product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductQuantityCubit(unitPrice: 10.0),
      child: Scaffold(
        body: Stack(
          children: [
            /// Gradient background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [mainColor, secondColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            /// Bottom white rounded container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .72,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.black26 : whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(
                  24,
                  0,
                  24,
                  100,
                ), // Leave space for button
                child: BlocBuilder<ProductQuantityCubit, QuantityState>(
                  builder: (context, state) {
                    final cubit = context.read<ProductQuantityCubit>();
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            Get.locale!.languageCode == "ar"
                                ? product!.nameAr
                                : product!.nameEn,
                            style: boldTextStyle,
                          ),
                          const SizedBox(height: 30),

                          /// Quantity + counter
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _roundIcon(
                                icon: Icons.remove,
                                onTap: cubit.decrement,
                              ),
                              const SizedBox(width: 24),

                              Text(
                                state.quantity.toString().padLeft(2, '0'),
                                style: boldTextStyle,
                              ),
                              const SizedBox(width: 24),
                              _roundIcon(
                                icon: Icons.add,
                                onTap: cubit.increment,
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          /// Price tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: secondColor.withOpacity(.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '\$${state.total.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: secondColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            /// Top content (AppBar + image)
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Hero(
                    tag: product!.image,
                    child: Center(
                      child: Image.asset(
                        product!.image,
                        height: 160.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Add to Cart button at bottom
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: BlocBuilder<ProductQuantityCubit, QuantityState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: mainColor,
                      ),
                      onPressed: () {},
                      child: Text('add_to_cart'.tr, style: textTextStyle),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundIcon({
    required IconData icon,
    required VoidCallback onTap,
    Color? bg,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: bg ?? Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: iconColor ?? Colors.black87),
      ),
    );
  }
}
