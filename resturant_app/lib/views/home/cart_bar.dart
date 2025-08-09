import 'package:resturant_app/constants/exported_package.dart';

class CartBar extends StatelessWidget {
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
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
