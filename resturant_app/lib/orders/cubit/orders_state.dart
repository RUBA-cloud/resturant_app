import 'package:equatable/equatable.dart';
import 'package:resturant_app/models/cart_item_model.dart';

abstract class OrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersError extends OrdersState {
  final String message;
  OrdersError(this.message);
}

class OrdersLoaded extends OrdersState {
  final List<CartItemModel> items;

  OrdersLoaded(this.items);

  @override
  List<Object?> get props => [items];
}
