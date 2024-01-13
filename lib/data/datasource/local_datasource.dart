import 'package:hive/hive.dart';

class LocalDataSource{
  Future<void> createBox({required String boxName}) async{
    final box = await Hive.openBox(boxName);
  }

  Future<void> post({required String boxName, required String dataKey, required dynamic data}) async{
    final box = await Hive.openBox(boxName);
    await box.put(dataKey, data);
  }

  Future<dynamic> get({required String boxName, required String dataKey}) async{
    final box = await Hive.openBox(boxName);
    var data = box.get(dataKey);
    return data;
  }
  Future<dynamic> delete({required String boxName, required String dataKey}) async{
    final box = await Hive.openBox(boxName);
    var data = box.get(dataKey);
    return data;
  }
}