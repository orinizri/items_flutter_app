import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/models/item.dart';
import 'package:shic/providers/favorites_provider.dart';
import 'package:shic/providers/filters_provider.dart';
import 'package:shic/providers/items_provider.dart';
import 'package:shic/screens/categories.dart';
import 'package:shic/screens/filters.dart';
import 'package:shic/screens/items.dart';
import 'package:shic/widgets/main_drawer.dart';

const initialFilters = {
  Filter.availableItemsFilter: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends ConsumerState<TabsScreen> {
  var selectedPageIndex = 0;
  final List<Item> favoriteItems = [];

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => const FiltersScreen(),
      ));
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemsConsumer = ref.watch(itemsProvider);
    final filtersConsumer = ref.watch(filtersProvider);
    final items = itemsConsumer.where((item) {
      if (filtersConsumer[Filter.availableItemsFilter]! && item.active == false) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableItems: items,
    );
    var activePageTitle = 'Categories';
    if (selectedPageIndex == 1) {
          final favoriteItemsConsumer = ref.watch(favoritesItemsProvider);
      activePage = ItemsScreen(
          title: 'Favorites',
          items: favoriteItemsConsumer);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );
  }
}
