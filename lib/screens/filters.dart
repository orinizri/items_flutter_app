import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/providers/filters_provider.dart';
// import 'package:shic/screens/tabs.dart';
// import 'package:shic/widgets/main_drawer.dart';

enum Filter {
  availableItemsFilter,
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final activeFilters = ref.read(filtersProvider);
  //   availableItemsFilter = activeFilters[Filter.availableItemsFilter]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (ctx) => const TabsScreen())
      //     );
      //   }
      // }),
      body: Column(children: [
        SwitchListTile(
          value: activeFilters[Filter.availableItemsFilter]!,
          onChanged: (isChecked) {
            ref.read(filtersProvider.notifier).setFilter(Filter.availableItemsFilter, isChecked);
          },
          title: Text(
            'Available Items',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Items you can borrow',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding:
              const EdgeInsetsDirectional.only(start: 30, end: 20),
        ),
      ]),
    );
  }
}
