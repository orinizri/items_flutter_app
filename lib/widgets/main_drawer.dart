import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                Icons.inventory,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Inventory',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.inventory_2_outlined),
          title: Text(
            'Items',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
          ),
          onTap: () {
            onSelectScreen('items');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
          ),
          onTap: () {
            onSelectScreen('filters');
          },
        )
      ],
    ));
  }
}
