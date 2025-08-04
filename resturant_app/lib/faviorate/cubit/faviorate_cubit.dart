import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/faviorate/cubit/faviorate_state.dart';
import 'package:resturant_app/models/cart_item_model.dart';
import 'package:resturant_app/views/cart/cubit/cart_state.dart';

class FaviorateCubit extends Cubit<FaviorateState> {
  FaviorateCubit() : super(FaviorateInitial());

  void loadFaviorate() {
    emit(
      FaviorateLoaded([
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

  void addItem(CartItemModel item) {
    if (state is CartLoaded) {
      final updated = List<CartItemModel>.from((state as CartLoaded).items)
        ..add(item);
      emit(FaviorateLoaded(updated));
    }
  }

  void removeItem(CartItemModel item) {
    if (state is CartLoaded) {
      final updated = List<CartItemModel>.from((state as CartLoaded).items)
        ..remove(item);
      emit(FaviorateLoaded(updated));
    }
  }

  void clearCart() {
    emit(FaviorateLoaded([]));
  }
}
