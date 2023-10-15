import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shic/data/items.dart';

final itemsProvider = Provider((providerRef) {
  return availableItems;
});