import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplaod_file/service/my_files.dart';
import 'package:uplaod_file/service/task_item.dart';
// import 'package:provider/provider.dart';
import 'package:uplaod_file/service/task_data.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF12375F),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF12375F),
          onPressed: () async {
            Provider.of<TaskListData>(context, listen: false).addFiles();

            // Pick the Files
            // FilePickerResult? result =
            //     await FilePicker.platform.pickFiles(allowMultiple: true);
            // if (result != null) {
            //   print(result.files.map((e) => e.size).toList());
            //   print(result.paths);
            //   this.paths = result.paths;
            //   // Rendet the List in UI
            //   // List<String?> fileNameList = result.names;
            //   TaskListData.files = result.files
            //       .map(
            //         (e) =>
            //             UplaodFile(size: e.size, name: e.name, path: e.path!),
            //       )
            //       .toList();
            // notify
            // TaskListData.fileNames = result.names;
            // } else {
            //   print("No File Selected");
            // }
            // notifyListeners();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 30.0, top: 50.0, right: 30.0, bottom: 30.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    // ignore: unnecessary_const
                    child: IconButton(
                      icon: Icon(
                        Icons.upload,
                        size: 30.0,
                      ),
                      // size: 30.0,
                      color: Color(0xFF12375F),
                      onPressed: () {
                        const CircularProgressIndicator();
                        Provider.of<TaskListData>(context, listen: false)
                            .send();
                      },
                    ),
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'File Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Files',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TaskItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
