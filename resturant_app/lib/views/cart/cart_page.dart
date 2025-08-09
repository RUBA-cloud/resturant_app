import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/models/cart_item_model.dart';
import 'package:resturant_app/views/cart/cubit/cart_cubit.dart';
import 'package:resturant_app/views/cart/cubit/cart_state.dart';
// import your constants

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..loadCart(), // your initial list
      child: Scaffold(
        appBar: AppBar(title: Text("Cart".tr)),
        body: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.78,

                    padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<CartCubit, CartState>(
                          builder: (c, state) {
                            return Expanded(
                              child: ListView.separated(
                                itemCount: state.items.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 16.h),
                                itemBuilder: (_, i) =>
                                    _GlassCartItem(item: state.items[i]),
                              ),
                            );
                          },
                        ),
                        Divider(color: Colors.white60),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (c, state) => _FooterSection(
                            subtotal: state.subtotal,
                            deliveryFee: 4.44,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassCartItem extends StatelessWidget {
  final CartItemModel item;
  const _GlassCartItem({required this.item});

  @override
  Widget build(BuildContext c) {
    final cubit = c.read<CartCubit>();
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: c.theme.cardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.r),
              topRight: Radius.circular(0.r),
              bottomRight: Radius.circular(langCode == "ar" ? 30 : 0),
              bottomLeft: Radius.circular(langCode == "ar" ? 0 : 30),
            ),
            // ignore: deprecated_member_use
            border: Border.all(
              // ignore: deprecated_member_use
              color: Colors.transparent.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: c.theme.cardTheme.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(langCode == "ar" ? 0 : 10),
                      topRight: Radius.circular(langCode == "ar" ? 10 : 0),
                      bottomRight: Radius.circular(langCode == "ar" ? 10 : 0),
                      bottomLeft: Radius.circular(langCode == "ar" ? 0 : 10),
                    ),
                  ),
                  child: Image.asset(
                    item.image,
                    width: 80.h,
                    height: 80.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    SizedBox(height: 4.h),
                    Text('\$${item.price.toStringAsFixed(2)}'),
                    Row(
                      children: [
                        _CircleBtn(
                          icon: Icons.remove,
                          onTap: () => cubit.decrement(item),
                        ),
                        SizedBox(width: 8.w),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            '${item.quantity}',
                            key: ValueKey(item.quantity),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        _CircleBtn(
                          icon: Icons.add,
                          onTap: () => cubit.increment(item),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 8.h),
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_rounded, color: mainColor),
                    ),
                  ),
                  // Text(
                  //   'hellp',
                  //   // style: boldTextStyle.copyWith(color: secondColor),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext c) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20.r),
    child: Container(
      width: 35.w,
      height: 35.w,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 1),
        color: primaryColor,

        shape: BoxShape.circle,
      ),
      child: IconButton(
        alignment: Alignment.center,
        icon: Icon(icon, size: 20.w),
        onPressed: onTap,
      ),
    ),
  );
}

class _FooterSection extends StatelessWidget {
  final double subtotal, deliveryFee;
  const _FooterSection({required this.subtotal, required this.deliveryFee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('delivery_charge'.tr),
              Text('\$${deliveryFee.toStringAsFixed(2)}'),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('total_amount'.tr),
              Text('USD ${subtotal.toStringAsFixed(2)}'),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: buttonWhiteStyle,
              onPressed: () => Get.toNamed(AppRoutes.home),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('make_payment'.tr, style: boldTextStyle),
                  SizedBox(width: 8.w),
                  Icon(Icons.arrow_forward, color: Colors.transparent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
