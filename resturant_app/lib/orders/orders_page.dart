import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/orders/cubit/orders_cubit.dart';
import 'package:resturant_app/orders/cubit/orders_state.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrdersCubit()..loadOrders(),
      child: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {
          if (state is OrdersInitial || state is OrdersLoading) {
            Get.dialog(
              const Center(child: CircularProgressIndicator()),
              barrierDismissible: false,
            );
          } else {
            Get.back(); // close dialog if open
          }

          if (state is OrdersError) {
            Get.snackbar(
              'orders_list_error'.tr,
              state.message,
              backgroundColor: Colors.red.shade100,
            );
          }
        },
        builder: (context, state) {
          if (state is OrdersLoaded) {
            const deliveryCharge = 4.44;
            final items = state.items;
            final totalAmount = items.fold<double>(
              deliveryCharge,
              (sum, item) => sum + item.price,
            );

            return SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: true,
                extendBody: true,
                body: BasicList(
                  items: items,
                  title: "orders".tr,
                  onItemTap: () {},
                  totalAmount: totalAmount,
                ),
              ),
            );
          }

          // Fallback for any unhandled state
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
