import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/models/item.dart';
import 'package:shic/providers/items_provider.dart';
import 'package:shic/screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.availableItemsFilter: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

// class FilteredItemsNotifier extends StateNotifier<List<Item>> {
//   FilteredItemsNotifier() : super([]);

//   void filterItems() {

//   }
// }

final filteredItemsProvider = Provider((ref) {
  var itemsConsumer = ref.watch(itemsProvider);
  var filtersConsumer = ref.watch(filtersProvider);
  return itemsConsumer.where((item) {
    if (filtersConsumer[Filter.availableItemsFilter]! && item.active == false) {
      return false;
    }
    return true;
  }).toList();
});
