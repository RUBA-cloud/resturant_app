import 'package:resturant_app/constants/exported_package.dart';

class CategoryModel {
  final String id;
  final String nameEn;
  final String nameAr;
  bool? selected;
  IconData? icon;

  CategoryModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.icon,
    bool isSelected = false,
  });
}
