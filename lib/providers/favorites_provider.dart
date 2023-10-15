import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/data/items.dart';
import 'package:shic/models/item.dart';

class FavoriteItemsNotifier extends StateNotifier<List<Item>> {
  FavoriteItemsNotifier() : super([]);

  bool toggleItemFavorite(Item item) {
    final isItemFavorite = state.contains(item);

    if (isItemFavorite) {
      state = state.where((i) => i.id != item.id).toList();
      return false;
    } else {
      state = [...state, item];
      return true;
    }
  }
}

final favoritesItemsProvider =
    StateNotifierProvider<FavoriteItemsNotifier, List<Item>>((ref) {
  return FavoriteItemsNotifier();
});
