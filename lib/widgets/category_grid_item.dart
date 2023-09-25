import 'package:flutter/material.dart';
import 'package:shic/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  void Function() onSelectCategory;

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 60, 74).withOpacity(0.55),
              Color.fromARGB(255, 72, 187, 210).withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
