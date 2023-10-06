import 'package:flutter/material.dart';
import 'package:shic/models/item.dart';
import 'package:shic/screens/categories.dart';
import 'package:shic/screens/items.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  var selectedPageIndex = 0;
  final List<Item> favoriteItems = [];

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void toggleFavorite(Item item) {
    final isFavorite = favoriteItems.contains(item);
    if (isFavorite) {
      setState(() {
        favoriteItems.remove(item);
        showInfoMessage('Item removed');
      });
    } else {
      setState(() {
        favoriteItems.add(item);
        showInfoMessage('Item added');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(toggleFavorite: toggleFavorite);
    var activePageTitle = 'Categories';
    if (selectedPageIndex == 1) {
      activePage = ItemsScreen(
          title: 'Favorites',
          items: favoriteItems,
          toggleFavorite: toggleFavorite);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
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
