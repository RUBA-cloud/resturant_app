import 'package:resturant_app/constants/exported_package.dart';

// ignore: must_be_immutable
class BasicList extends StatelessWidget {
  final List items;
  final String title;
  final double totalAmount;
  final void Function()? onItemTap;

  const BasicList({
    super.key,
    required this.items,
    required this.title,
    this.onItemTap,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header showing title and count
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: headingStyle),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: whiteColor,
                    child: Text('${items.length}', style: headingStyle),
                  ),
                ],
              ),
            ),

            // List container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: boxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),

                  // Each item
                  for (final item in items) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 4),

                          // Delete button, centered
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: whiteColor,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                icon: const Icon(
                                  Icons.delete,
                                  color: mainColor,
                                ),
                                onPressed: () {
                                  if (onItemTap != null) onItemTap!();
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Item row
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(item.image),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.name, style: boldTextStyle),
                                    Text(item.desc, style: boldTextStyle),
                                  ],
                                ),
                              ),
                              Text(
                                '\$${item.price.toStringAsFixed(2)}',
                                style: boldTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 16),

                  // Delivery charge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('delivery_charge'.tr, style: boldTextStyle),
                      Text('\$4.44', style: boldTextStyle),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Total amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('total_amount'.tr, style: boldTextStyle),
                      Text(
                        'USD ${totalAmount.toStringAsFixed(2)}',
                        style: boldTextStyle,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Payment button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: buttonWhiteStyle,
                      onPressed: () => Get.toNamed(AppRoutes.home),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('make_payment'.tr, style: boldTextStyle),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, color: purpleDark),
                        ],
                      ),
                    ),
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
