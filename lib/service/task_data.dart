import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uplaod_file/service/my_files.dart';
import 'package:http/http.dart' as http;

class TaskListData extends ChangeNotifier {
  List<UplaodFile> files = [];
  void deletetask(int indexat) {
    files.removeAt(indexat);
    // Have to remove from cache also

    notifyListeners();
  }

  void addFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      print(result.files.map((e) => e.size).toList());
      print(result.paths);
      // Rendet the List in UI
      // List<String?> fileNameList = result.names;
      files = result.files
          .map(
            (e) => UplaodFile(size: e.size, name: e.name, path: e.path!),
          )
          .toList();
      notifyListeners();
    }
  }

  void send() async {
    var uri = Uri.parse('https://api-talaash.herokuapp.com/test/upload');
    var request = http.MultipartRequest('POST', uri);
    // ..fields['user'] = 'nweiz@google.com'
    // ..fields['user'] = 'nweiz@google.com'
    // ..fields['user'] = 'nweiz@google.com'
    // ..fields['user'] = 'nweiz@google.com'
    // ..fields['name'] = 'Arkadev Banerjee';
    for (var i = 0; i < files.length; i++) {
      request.files
          .add(await http.MultipartFile.fromPath('files', files[i].path));
    }
    var response = await request.send();
    // print(response.statusCode);
    if (response.statusCode == 201) {
      print('Response=' + await response.stream.bytesToString());
      // const AlertDialog(
      //   title: Text('Files Uploaded'),
      // );
    } else {
      // Again do some UI stuffs
      // print(response.toString());
      // const AlertDialog(
      //   title: Text('Upload Failed'),
      // );
      print('Response=' + await response.stream.bytesToString());
    }
  }
}
