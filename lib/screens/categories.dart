import 'package:flutter/material.dart';
import 'package:shic/data/categories.dart';
import 'package:shic/data/items.dart';
import 'package:shic/models/category.dart';
import 'package:shic/models/item.dart';
import 'package:shic/screens/items.dart';
import 'package:shic/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.toggleFavorite});

  void Function(Item) toggleFavorite;

  void _onSelectCategory(BuildContext context, Category category) {
    final List<Item> filteredItems = availableItems
        .where((item) => item.categories.contains(category.title))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ItemsScreen(title: 'Items', items: filteredItems, toggleFavorite: toggleFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        for (final availableCategory in availableCategories)
          CategoryGridItem(
            category: availableCategory,
            onSelectCategory: () {
              _onSelectCategory(context, availableCategory);
            },
          )
      ],
    );
  }
}
