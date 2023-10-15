import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/data/items.dart';
import 'package:shic/models/item.dart';
import 'package:shic/providers/favorites_provider.dart';

class ItemDetails extends ConsumerWidget {
  const ItemDetails({super.key, required this.item});

  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesProvider = ref.watch(favoritesItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        actions: [
          IconButton(
            onPressed: () {
              final bool itemWasAdded = ref
                  .read(favoritesItemsProvider.notifier)
                  .toggleItemFavorite(item);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(itemWasAdded ? 'Item added' : 'Item removed')),
              );
            },
            icon: favoritesProvider.contains(item) ? const Icon(Icons.star) : const Icon(Icons.star_border_outlined),
          )
        ],
      ),
      body: ListView(children: [
        Image.network(
          item.imageUrl!,
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 14),
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
          textAlign: TextAlign.center,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "description: ",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              Text(
                item.description,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "start date: ",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              Text(
                formatter.format(item.startDate),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ]),
          ]),
        )
      ]),
    );
  }
}
