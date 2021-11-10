import 'package:flutter/material.dart';
import 'package:uplaod_file/service/task_data.dart';
import 'package:uplaod_file/service/tasks_details.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListData>(
      builder: (context, fileBuild, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final filetool = fileBuild.files[index];
            return TasksTile(
              taskTitle: filetool.name,
              size: filetool.getShowableSize(),
              onPress: () {
                fileBuild.deletetask(index);
              },
            );
          },
          itemCount: fileBuild.files.length,
        );
      },
    );
  }
}
