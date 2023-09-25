import 'package:flutter/material.dart';
import 'package:shic/models/item.dart' as item_model;

class Item extends StatelessWidget {
  const Item({super.key, required this.item});

  final item_model.Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).textTheme.bodyLarge!.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            item.imageUrl != null
                ? Image.network(item.imageUrl!)
                : const SizedBox(
                    height: 1,
                  ),
            Text(
              item.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              item.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
