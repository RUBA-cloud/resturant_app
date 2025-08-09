import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isArabic;

  const ProductCard({super.key, required this.product, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.productDetails, arguments: product),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // ignore: deprecated_member_use
        color: context.theme.cardTheme.color,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(product.image, fit: BoxFit.contain)),
              const SizedBox(height: 10),
              Text(
                langCode == "ar" ? product.nameAr : product.nameAr,
                style: boldTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "${product.price.toStringAsFixed(2)} \$",
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 14,
                    color: index < product.rate
                        ? Colors.amber
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
