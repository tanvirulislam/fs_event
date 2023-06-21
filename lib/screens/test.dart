// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart' as pathname;
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TesScreenState();
}

class _TesScreenState extends State<TestScreen> {
  void findDirectory() async {
    // String currentPath = Directory.current.path;
    // final projectDirectory = pathname.dirname(currentPath);
    // print(projectDirectory);
    final path = await getApplicationDocumentsDirectory();
    final dir = Directory(path.path);
    print(dir);
  }

  @override
  void initState() {
    super.initState();
    findDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
