import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/isar/isar.dart';
import 'package:new_project/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.openDB();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Event',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        // home: TestScreen(),
      ),
    );
  }
}
