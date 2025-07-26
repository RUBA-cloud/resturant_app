class CategoryModel {
  final String id;
  final String nameEn;
  final String nameAr;
  bool? get selected => null;

  CategoryModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    bool isSelected = false,
  });
}
