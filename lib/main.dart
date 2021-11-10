import 'package:flutter/material.dart';
import 'package:uplaod_file/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:uplaod_file/service/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
