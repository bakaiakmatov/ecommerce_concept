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

  @override
  int get hashCode => icon.hashCode ^ text.hashCode;

  @override
  bool operator ==(Object other) => (other is CategoryCardRes) && other.icon == icon && other.text == text;
}
