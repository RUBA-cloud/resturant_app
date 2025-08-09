import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/models/cart_item_model.dart';
import 'package:resturant_app/views/cart/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void increment(CartItemModel i) {
    i.quantity++;
    //  emit(CartState());
  }

  void decrement(CartItemModel i) {
    if (i.quantity > 1) {
      i.quantity--;
      // emit(CartState(state.items));
    }
  }

  void loadCart() {
    emit(
      CartLoaded([
        CartItemModel(
          quantity: 0,
          name: 'Chocolate',
          desc: 'Peanut butter ripple',
          price: 5.00,
          image: 'asset/images/burger0.png',
        ),
        CartItemModel(
          quantity: 2,
          name: 'Turtle Crossing',
          desc: 'Creamy vanilla x 2',
          price: 5.00,
          image: 'asset/images/burger1.png',
        ),
        CartItemModel(
          quantity: 4,
          name: 'Chocolate Chip',
          desc: 'Green peppermint',
          price: 3.00,
          image: 'asset/images/cake0.png',
        ),
        CartItemModel(
          quantity: 4,
          name: 'Chocolate Chip',
          desc: 'Green peppermint',
          price: 5.00,
          image: 'asset/images/cake0.png',
        ),
      ]),
    );
  }

  void addItem(CartItemModel item) {
    if (state is CartLoaded) {
      final updated = List<CartItemModel>.from((state as CartLoaded).items)
        ..add(item);
      emit(CartLoaded(updated));
    }
  }

  void removeItem(CartItemModel item) {
    if (state is CartLoaded) {
      final updated = List<CartItemModel>.from((state as CartLoaded).items)
        ..remove(item);
      emit(CartLoaded(updated));
    }
  }

  void clearCart() {
    emit(CartLoaded([]));
  }
}
