import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MyDocuments {
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData(List _list) async {
    String data = json.encode(_list);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return "err";
    }
  }
}
