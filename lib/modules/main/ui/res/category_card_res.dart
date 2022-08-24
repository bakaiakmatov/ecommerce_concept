import '../../../../resources/app_icons.dart';

class CategoryCardRes {
  final String icon;
  final String text;
  CategoryCardRes({
    required this.icon,
    required this.text,
  });
  static List<CategoryCardRes> categoryList = [
    CategoryCardRes(
      icon: AppIconPaths.phone,
      text: 'Phones',
    ),
    CategoryCardRes(
      icon: AppIconPaths.computer,
      text: 'Computer',
    ),
    CategoryCardRes(
      icon: AppIconPaths.health,
      text: 'health',
    ),
    CategoryCardRes(
      icon: AppIconPaths.books,
      text: 'Books',
    ),
     CategoryCardRes(
      icon: AppIconPaths.computer,
      text: 'Accessories',
    ),
  ];
}
