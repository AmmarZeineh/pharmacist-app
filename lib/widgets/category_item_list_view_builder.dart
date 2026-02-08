import 'package:flutter/material.dart';
import 'package:pharmacy_app/widgets/category_item.dart';

class CategoryItemListViewBuilder extends StatelessWidget {
  const CategoryItemListViewBuilder(
      {super.key, required this.categoryItemList});
  final List<CategoryItem> categoryItemList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return categoryItemList[index];
      },
      scrollDirection: Axis.horizontal,
      itemCount: categoryItemList.length,
    );
  }
}
