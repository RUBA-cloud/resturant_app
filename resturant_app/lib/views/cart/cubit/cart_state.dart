import 'package:equatable/equatable.dart';
import 'package:resturant_app/models/cart_item_model.dart';

// ignore: must_be_immutable
abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
  List<CartItemModel> items = [];
  double get subtotal => items.fold(0, (sum, i) => sum + 4.44);
}

// ignore: must_be_immutable
class CartInitial extends CartState {}

// ignore: must_be_immutable
class CartLoading extends CartState {}

// ignore: must_be_immutable
class CartError extends CartState {
  final String message;
  CartError(this.message) : super();
}

// ignore: must_be_immutable
class CartLoaded extends CartState {
  @override
  // ignore: overridden_fields
  List<CartItemModel> items;

  CartLoaded(this.items);

  @override
  List<Object?> get props => [items];
}
