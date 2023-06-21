import 'package:isar/isar.dart';
import 'package:new_project/collection/collection.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

class IsarService {
  static openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [FSEventsSchema],
      directory: dir.path,
    );
  }
}
