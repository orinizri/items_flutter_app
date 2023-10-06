import 'package:flutter/material.dart';
import 'package:shic/data/items.dart';
import 'package:shic/models/item.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({super.key, required this.item, required this.toggleFavorite});

  final Item item;
  void Function(Item item) toggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        actions: [
          IconButton(
            onPressed: () {
              toggleFavorite(item);
            },
            icon: const Icon(Icons.star),
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
