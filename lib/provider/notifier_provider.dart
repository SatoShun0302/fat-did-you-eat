import 'package:diet_app/model/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/item_notifier.dart';

final itemNotifierProvider = AsyncNotifierProvider.autoDispose<ItemNotifier, List<Item>>(() => ItemNotifier());