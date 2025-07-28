import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/constants/colors.dart';
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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // gradient bg like the dribbble shot
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [mainColor, Color(0xFFff6a88)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // white rounded sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .72,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// AppBar simplified
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

                  const SizedBox(height: 8),

                  /// Product image (center big)
                  Expanded(
                    child: Hero(
                      tag: product!.image,
                      child: Center(
                        child: Image.asset(
                          product!.image,
                          height: 260,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  /// Bottom card content
                  BlocBuilder<ProductQuantityCubit, QuantityState>(
                    builder: (context, state) {
                      final cubit = context.read<ProductQuantityCubit>();
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product!.nameEn,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 12),

                            /// Counter + price pill
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
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                _roundIcon(
                                  icon: Icons.add,
                                  onTap: cubit.increment,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            /// price chip
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFff9d76).withOpacity(.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '\$${state.total.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFff6a88),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// Add to cart + delete
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      backgroundColor: const Color(0xFFff6a88),
                                    ),
                                    onPressed: () {
                                      // TODO: dispatch to CartCubit or repo...
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Added ${state.quantity} to cart',
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Add To Cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                _roundIcon(
                                  icon: Icons.delete_outline,
                                  onTap: cubit.reset,
                                  bg: Colors.red.withOpacity(.08),
                                  iconColor: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
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
          color: bg ?? Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: iconColor ?? Colors.black87),
      ),
    );
  }
}
