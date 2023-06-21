// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'collection.g.dart';

@Collection()
class FSEvents {
  Id? id = Isar.autoIncrement;
  late String path;
  late int type;
  FSEvents({
    required this.path,
    required this.type,
  });
}
