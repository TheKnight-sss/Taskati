import 'package:hive/hive.dart';
import 'package:taskati/core/models/task_model.dart';

class LocalHelper {
  static late Box userBox;  
  static late Box taskBox;
  
  static String xname = 'name';
  static String ximage = 'image';
  static String xisUploaded = 'isUploaded';

  static init() async {
    Hive.registerAdapter(TaskModelAdapter());
   userBox = await Hive.openBox('userBox');
   taskBox = await Hive.openBox<TaskModel>('taskBox');
  }

  static putData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static putTask(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getTask(String key) {
    return taskBox.get(key);
  }

  static putUserData(String name, String image) {
    putData(xname, name);
    putData(ximage, image);
    putData(xisUploaded, true);
  }
}
