import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/provider/provider.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // var newEvent = ref.watch(watchProvider);
    var streamRef = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Upcoming event')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    ref.read(watchProvider.notifier).stroreFolderEvent();
                  },
                  child: Text('Pick a Folder'),
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(watchProvider.notifier).storeFileEvent();
                    },
                    child: Text('Pick a file'))
              ],
            ),
            Expanded(
              child: streamRef.when(
                data: (events) => ListView(
                  shrinkWrap: true,
                  children: [
                    for (final event in events)
                      Card(
                        child: ListTile(
                          leading:
                              CircleAvatar(child: Text(event.id.toString())),
                          title: Text(event.path.toString()),
                          subtitle:
                              Text("Event-type: ${event.type.toString()}"),
                        ),
                      ),
                  ],
                ),
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () => Center(child: CircleAvatar()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
