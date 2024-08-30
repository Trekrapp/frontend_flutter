import 'package:trekr_second/core/constants/app_assets.dart';

class Category {
  final String imagePath;
  final String title;

  Category({required this.imagePath, required this.title});
}

class CategoryList {
  static final List<Category> categories = [
    Category(imagePath: AppAssets.asia, title: 'Asie'),
    Category(imagePath: AppAssets.europe, title: 'Europe'),
    Category(imagePath: AppAssets.africa, title: 'Afrique'),
    Category(imagePath: AppAssets.america, title: 'Amérique'),
  ];
}
