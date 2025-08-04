import 'package:equatable/equatable.dart';
import 'package:resturant_app/models/cart_item_model.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartLoaded extends CartState {
  final List<CartItemModel> items;

  CartLoaded(this.items);

  @override
  List<Object?> get props => [items];
}
