import 'package:flutter/material.dart';
import 'package:shic/models/item.dart' as item_model;
import 'package:shic/data/items.dart';
import 'package:shic/widgets/item.dart' as item_widget;

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key, required this.items});

  final List<item_model.Item> items;

  @override
  Widget build(BuildContext context) {
    print(items.length);
    dynamic content = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return item_widget.Item(item: items[index]);
      },
    );
    if (items.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('items not found', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              )),
            const SizedBox(height: 10,),
            Text('try a different category', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              )
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: content,
    );
  }
}
