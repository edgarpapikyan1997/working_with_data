import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:working_with_data_project/models/user_model/user_model.dart';

class StorageDataProvider {
  dynamic box;
  void doSome(String? text) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    box = await Hive.openBox<UserModel>("TestBox");
    final user = UserModel(id: 15, name: 'ivan');
    await box.add(user);
    print(box.values);
    // if (text == '' || text == null) {
    //   print('empty values: ${box.values}');
    //   return;
    // }
    // box.put('name',  'Ivan');
    // box.put('surname', 'Ivan');
    // final name = box.get('name') as String?;
    // print(name);

    // final major = box.get('major', defaultValue: 'Engineer');
    print(box.keys);
    // box.add(text);
  }

  void delete(String? text) async {
    var box = Hive.box<UserModel>("TestBox");
    box.deleteAll(box.keys);
    box.close();
    print('deleted and closed');
    // print(box.keys);
  }

  void readFile() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    final filePath = directory.path + '/image.png';
    final file = File(filePath);
    final result = await file.readAsBytes();

    // file.exists() ? print(file) : print('dddd');
  }
}
