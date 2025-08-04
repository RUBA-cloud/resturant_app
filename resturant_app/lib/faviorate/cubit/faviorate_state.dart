import 'package:equatable/equatable.dart';
import 'package:resturant_app/models/cart_item_model.dart';

abstract class FaviorateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FaviorateInitial extends FaviorateState {}

class FaviorateLoading extends FaviorateState {}

class FaviorateError extends FaviorateState {
  final String message;
  FaviorateError(this.message);
}

class FaviorateLoaded extends FaviorateState {
  final List<CartItemModel> items;

  FaviorateLoaded(this.items);

  @override
  List<Object?> get props => [items];
}
