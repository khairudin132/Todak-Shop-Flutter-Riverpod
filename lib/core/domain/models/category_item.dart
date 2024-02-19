import 'package:todak_shop/core/core.dart';

class CategoryItem {
  CategoryItem({
    required this.index,
    required this.rawString,
  });

  final int index;
  final String rawString;

  String get label => rawString.formatCategoryString();
}
