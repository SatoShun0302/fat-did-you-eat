import 'package:diet_app/repository/local_database_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDatabaseRepositoryProvider = Provider((ref) => LocalDatabaseRepository());