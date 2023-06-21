import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:new_project/collection/collection.dart';
import 'package:new_project/isar/isar.dart';

final watchProvider =
    AsyncNotifierProvider<WatchNotifier, List<FSEvents>>(WatchNotifier.new);

final streamProvider = StreamProvider((ref) {
  return isar.fSEvents.where().build().watch(fireImmediately: true);
});

class WatchNotifier extends AsyncNotifier<List<FSEvents>> {
  @override
  build() {
    return stroreEvent();
  }

  stroreEvent() async {
    // PermissionStatus storageStatus = await Permission.storage.request();
    // if (storageStatus == PermissionStatus.granted) {

    // } else {}
    String? result = await FilePicker.platform.getDirectoryPath();

    // final listStringPath = result.paths.first?.replaceAll('event.txt', '');
    // String newString =
    //     listStringPath.where((element) => element != null).join('');
    final dir = Directory(result!);
    log(dir.path);
    final stream = dir.watch(recursive: true).map((event) {
      // print('${event}---------------------------');
      return FSEvents(path: event.path, type: event.type);
    });
    try {
      stream.listen((event) async {
        log(event.path.toString());
        await isar.writeTxn(() async {
          await isar.fSEvents.put(event);
        });
      });
    } catch (e) {
      log(e.toString());
    }
    return stream;
  }
}
