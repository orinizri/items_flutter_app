import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/providers/filters_provider.dart';
// import 'package:shic/screens/tabs.dart';
// import 'package:shic/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return FiltersScreenState();
  }
}

enum Filter {
  availableItemsFilter,
}

class FiltersScreenState extends ConsumerState<FiltersScreen> {
  var availableItemsFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    availableItemsFilter = activeFilters[Filter.availableItemsFilter]!;
  }

  @override
  Widget build(BuildContext context) {
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
      body: WillPopScope(
        onWillPop: () async {
          ref
              .read(filtersProvider.notifier)
              .setFilters({Filter.availableItemsFilter: availableItemsFilter});
          return true;
        },
        child: Column(children: [
          SwitchListTile(
            value: availableItemsFilter,
            onChanged: (isChecked) {
              setState(() {
                availableItemsFilter = isChecked;
              });
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
      ),
    );
  }
}
