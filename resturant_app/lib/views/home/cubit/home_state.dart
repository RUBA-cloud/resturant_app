import 'package:resturant_app/models/category_model.dart';
import 'package:resturant_app/models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  HomeLoaded({required this.categories, required this.products});
}

class HomeCategoryChanged extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final int selectedCategory;

  HomeCategoryChanged({
    required this.categories,
    required this.products,
    required this.selectedCategory,
  });
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
