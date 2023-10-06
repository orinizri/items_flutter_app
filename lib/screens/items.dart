import 'package:flutter/material.dart';
import 'package:shic/models/item.dart' as item_model;
import 'package:shic/data/items.dart';
import 'package:shic/screens/item_details.dart';
import 'package:shic/widgets/item.dart' as item_widget;

class ItemsScreen extends StatelessWidget {
  ItemsScreen({super.key, required this.items, this.title, required this.toggleFavorite});

  final List<item_model.Item> items;
  final String? title;
  void Function(item_model.Item) toggleFavorite;

  void _onSelectItem(context, item) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ItemDetails(item: item, toggleFavorite: toggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    dynamic content = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => item_widget.Item(
            item: items[index],
            onSelectItem: (item) {
              _onSelectItem(context, item);
            }));
    if (items.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('items not found',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 10,
            ),
            Text('try a different category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ],
        ),
      );
    }
    return title != null
        ? content
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content,
          );
  }
}
