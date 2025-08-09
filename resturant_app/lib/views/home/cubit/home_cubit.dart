import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/models/category_model.dart';
import 'package:resturant_app/models/product_model.dart';

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
      CategoryModel(
        id: '1',
        icon: Icons.category,
        nameEn: "All",
        nameAr: "الكل",
      ),
      CategoryModel(
        id: '2',
        icon: Icons.icecream_sharp,
        nameEn: "Ice-Cream",
        nameAr: "آيس كريم",
      ),
      CategoryModel(id: '3', icon: Icons.cake, nameEn: "Cake", nameAr: "كيك"),
      CategoryModel(
        id: '4',
        icon: Icons.local_drink,
        nameEn: "Juice",
        nameAr: "عصير",
      ),
      CategoryModel(
        id: '5',
        icon: Icons.coffee,
        nameEn: "Coffee",
        nameAr: "قهوة",
      ),
      CategoryModel(
        id: '6',
        icon: Icons.fastfood,
        nameEn: "Burger",
        nameAr: "برجر",
      ),
      CategoryModel(
        id: '7',
        icon: Icons.ramen_dining,
        nameEn: "pasta",
        nameAr: "باستا",
      ),
    ];
    products = [
      ProductModel(
        isPopular: true,

        rate: 4,
        description: '',
        id: 'p1',
        nameEn: "Yummmy Ice-Cream",
        nameAr: "آيس كريم لذيذ",
        image: "asset/images/ice_cream0.webp",
        price: 12.00,
        categoryId: '2',
      ),
      ProductModel(
        rate: 4,

        id: 'p2',
        nameEn: "Chocolate Cake",
        nameAr: "كيك الشوكولاتة",
        image: "asset/images/cake0.png",
        price: 15.00,
        categoryId: '3',
        isPopular: true,

        description: 'Delicious chocolate cake with rich frosting',
      ),
      ProductModel(
        rate: 4,
        isPopular: true,

        id: 'p2',
        nameEn: "Chocolate Cake",
        nameAr: "كيك الشوكولاتة",
        image: "asset/images/cake2.png",
        price: 15.00,
        categoryId: '3',
        description: 'Delicious chocolate cake with rich frosting',
      ),
      ProductModel(
        isPopular: true,

        rate: 4,

        id: 'p2',
        nameEn: " Dark Chocolate Cake",
        nameAr: "كيك الشوكولاتة الداكنة",
        image: "asset/images/cak4.png",
        price: 10.00,
        categoryId: '3',
        description: 'Delicious  Dark chocolate cake with rich frosting',
      ),
      ProductModel(
        id: 'p2',
        nameEn: 'Burger Delight',
        nameAr: "برجر لذيذ",
        image: "asset/images/burger0.png",
        price: 10.00,
        categoryId: '6',
        description: 'Juicy burger with fresh ingredients',
        rate: 4,
        isPopular: false,
      ),
      ProductModel(
        isPopular: true,

        description: 'Freshly squeezed orange juice',
        rate: 4,

        id: 'p3',
        nameEn: "Fresh Juice",
        nameAr: "عصير طازج",
        image: "asset/images/juice0.png",
        price: 8.00,
        categoryId: '4',
      ),
      ProductModel(
        isPopular: false,

        description: 'Freshly squeezed orange juice',
        id: 'p3',
        nameEn: "Fresh Juice",
        nameAr: "عصير طازج",
        image: "asset/images/mango.png",
        rate: 4,

        price: 8.00,
        categoryId: '4',
      ),
      ProductModel(
        isPopular: true,
        description: 'Rich and creamy coffee latte',
        id: 'p4',
        nameEn: "Coffee Latte",
        nameAr: "قهوة لاتيه",
        image: "asset/images/coffe1.png",
        price: 10.00,
        categoryId: '5',
        rate: 4,
      ),
      ProductModel(
        isPopular: false,
        description: 'Crispy burger with a juicy patty',
        id: 'p5',
        nameEn: "Crispy burger ",
        nameAr: "برجر مقرمش",
        image: "asset/images/burger1.png",
        price: 11.00,
        rate: 4,
        categoryId: '6',
      ),
      ProductModel(
        isPopular: false,
        description: 'Crispy burger with a juicy patty',
        id: 'p5',
        nameEn: "Crispy burger ",
        nameAr: "برجر مقرمش",
        image: "asset/images/sandwish.png",
        price: 11.00,
        categoryId: '6',
        rate: 4,
      ),
      ProductModel(
        rate: 4,
        isPopular: false,

        description: 'Classic vanilla ice cream with a smooth texture',
        id: 'p5',
        nameEn: "Vanilla Ice-Cream",
        nameAr: "آيس كريم فانيليا",
        image: "asset/images/ice_cream2.jpeg",
        price: 11.00,
        categoryId: '6',
      ),
      ProductModel(
        rate: 4,
        isPopular: false,

        description: 'Classic vanilla ice cream with a smooth texture',
        id: 'p5',
        nameEn: "Tasty Ice-Cream",
        nameAr: "آيس كريم لذيذ",
        image: "asset/images/ice_cream1.webp",
        price: 11.00,
        categoryId: '2',
      ),
      ProductModel(
        rate: 4,
        isPopular: false,

        description: 'Rich and creamy coffee latte',
        id: 'p4',
        nameEn: "Coffee Latte",
        nameAr: "قهوة لاتيه",
        image: "asset/images/coffe3.png",
        price: 10.00,
        categoryId: '5',
      ),

      ProductModel(
        rate: 4,
        isPopular: false,

        description: 'Ice Coffee with a refreshing taste',
        id: 'p4',
        nameEn: "Ice Coffee",
        nameAr: "قهوة مثلجة",
        image: "asset/images/coffe2.png",
        price: 10.00,
        categoryId: '5',
      ),
      ProductModel(
        rate: 4,
        isPopular: false,

        description: 'Ice Coffee with a refreshing taste',
        id: 'p4',
        nameEn: "Pasta Delight",
        nameAr: "باستا لذيذة",
        image: "asset/images/pasta0.png",
        price: 10.00,
        categoryId: '6',
      ),
      ProductModel(
        rate: 4,
        isPopular: false,

        description: 'Pasta with a creamy sauce and fresh herbs',
        id: 'p4',
        nameEn: "Pasta Delight",
        nameAr: "باستا لذيذة",
        image: "asset/images/pasta1.png",
        price: 10.00,
        categoryId: '7',
      ),
      ProductModel(
        isPopular: false,

        rate: 4,

        description: 'Pasta with a creamy sauce and fresh herbs',
        id: 'p4',
        nameEn: "Pasta Delight",
        nameAr: "باستا لذيذة",
        image: "asset/images/pasta3.png",
        price: 10.00,
        categoryId: '7',
      ),
    ];
    emit(HomeLoaded(categories: categories, products: products));
  }
}
