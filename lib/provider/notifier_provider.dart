import 'package:diet_app/model/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/history.dart';
import '../notifier/item_notifier.dart';
import '../notifier/todays_item_notifier.dart';

final itemNotifierProvider = AsyncNotifierProvider.autoDispose<ItemNotifier, List<Item>>(() => ItemNotifier());
final todaysItemNotifierProvider = AsyncNotifierProvider.autoDispose<TodaysItemNotifier, List<History>>(() => TodaysItemNotifier());