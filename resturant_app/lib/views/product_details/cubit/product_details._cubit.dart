import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/views/product_details/cubit/product_details_state.dart';

class ProductQuantityCubit extends Cubit<QuantityState> {
  ProductQuantityCubit({required double unitPrice})
    : super(QuantityState(quantity: 1, unitPrice: unitPrice));

  void increment() => emit(state.copyWith(quantity: state.quantity + 1));

  void decrement() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void reset() => emit(state.copyWith(quantity: 1));
}
