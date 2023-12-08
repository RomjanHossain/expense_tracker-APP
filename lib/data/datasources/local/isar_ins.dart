import 'package:expense_tracker/data/datasources/local/expense/expense_isardb.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  IsarService() {
    database = openDatabase();
  }
  late Future<Isar> database;

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [
          ExpenseLocalDBSchema,
        ], // Here we will add a schema's
        directory: dir.path,
      );

      return isar;
    }

    return Future.value(Isar.getInstance());
  }
}
