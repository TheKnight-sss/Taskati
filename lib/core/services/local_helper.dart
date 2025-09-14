import 'package:hive/hive.dart';

class LocalHelper {
  static late Box userBox;
  
  static String xname = 'name';
  static String ximage = 'image';
  static String xisUploaded = 'isUploaded';

  static init() async {
   userBox = await Hive.openBox('userBox');
  }

  static putData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static putUserData(String name, String image) {
    putData(xname, name);
    putData(ximage, image);
    putData(xisUploaded, true);
  }
}
