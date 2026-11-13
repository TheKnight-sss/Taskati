import 'package:hive/hive.dart';
import 'package:taskati/core/models/task_model.dart';

class LocalHelper{
  static late Box userBox;
  static late Box <TaskModel>taskBox;

  static String kname = 'name';
  static String kimage = 'image';
  static String kisuploaded = 'isUploaded';

  static init() async{
    Hive.registerAdapter(TaskModelAdapter());
    userBox =  await Hive.openBox('userBox');
    taskBox =  await Hive.openBox<TaskModel>('taskBox');
  }

  static putData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static putTaskData(String key,TaskModel value ){
    taskBox.put(key, value);
  }

  static TaskModel? getTaskData(String key){
    return taskBox.get(key);
  }

  static putUserData(String name, String image) {
    putData(kname, name);
    putData(kimage, image);
    putData(kisuploaded, true);
  }
}