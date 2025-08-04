import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/models/cart_item_model.dart';
import 'package:resturant_app/orders/cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void loadOrders() {
    emit(
      OrdersLoaded([
        CartItemModel(
          name: 'Chocolate',
          desc: 'Peanut butter ripple',
          price: 5.00,
          image: 'asset/images/burger0.png',
        ),
        CartItemModel(
          name: 'Turtle Crossing',
          desc: 'Creamy vanilla x 2',
          price: 5.00,
          image: 'asset/images/burger1.png',
        ),
        CartItemModel(
          name: 'Chocolate Chip',
          desc: 'Green peppermint',
          price: 3.00,
          image: 'asset/images/cake0.png',
        ),
        CartItemModel(
          name: 'Chocolate Chip',
          desc: 'Green peppermint',
          price: 5.00,
          image: 'asset/images/cake0.png',
        ),
      ]),
    );
  }
}
