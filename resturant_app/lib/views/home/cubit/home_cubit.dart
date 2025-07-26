import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/models/category_model.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/views/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());
  late List<CategoryModel> categories;
  late List<ProductModel> products;
  int selectedCategory = 0; // Index of the selected category
  void selectCategory(int index) {
    selectedCategory = index; // Update the selected category index
    emit(
      HomeCategoryChanged(
        categories: categories,
        products: products,
        selectedCategory: selectedCategory,
      ),
    );
  }

  ProductModel getFeaturedProduct(
    List<CategoryModel> categories,
    List<ProductModel> products,
    int selectedCategory,
  ) {
    final filtered = products
        .where(
          (p) =>
              selectedCategory == 0 ||
              p.categoryId == categories[selectedCategory].id,
        )
        .toList();

    return filtered.isNotEmpty ? filtered.first : products.first;
  }

  void loadHome() async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading
    categories = [
      CategoryModel(id: 'p1', nameEn: "All", nameAr: "الكل"),
      CategoryModel(id: 'p2', nameEn: "Ice-Cream", nameAr: "آيس كريم"),
      CategoryModel(id: 'p3', nameEn: "Cake", nameAr: "كيك"),
      CategoryModel(id: 'p4', nameEn: "Juice", nameAr: "عصير"),
      CategoryModel(id: 'p5', nameEn: "Coffee", nameAr: "قهوة"),
      CategoryModel(id: 'p6', nameEn: "Burger", nameAr: "آيس كريم"),
      CategoryModel(id: 'p7', nameEn: "pasta", nameAr: "الكل"),
    ];
    products = [
      ProductModel(
        description: '',
        id: 'p1',
        nameEn: "Oat & Mill Rocky Road",
        nameAr: "روكي رود",
        image: "asset/images/test7.png",
        price: 12.00,
        categoryId: '2',
      ),
      ProductModel(
        id: 'p2',
        nameEn: "Chocolate Cake",
        nameAr: "كيك الشوكولاتة",
        image: "asset/images/test12.jpg",
        price: 15.00,
        categoryId: '3',
        description: '',
      ),
      ProductModel(
        description: '',
        id: 'p3',
        nameEn: "Fresh Juice",
        nameAr: "عصير طازج",
        image: "asset/images/test14.jpg",
        price: 8.00,
        categoryId: '4',
      ),
      ProductModel(
        description: '',
        id: 'p4',
        nameEn: "Coffee Latte",
        nameAr: "قهوة لاتيه",
        image: "asset/images/test13.png",
        price: 10.00,
        categoryId: '5',
      ),
      ProductModel(
        description: '',
        id: 'p5',
        nameEn: "Vanilla Ice-Cream",
        nameAr: "آيس كريم فانيليا",
        image: "asset/images/test7.png",
        price: 11.00,
        categoryId: '2',
      ),
    ];
    emit(HomeLoaded(categories: categories, products: products));
  }
}
