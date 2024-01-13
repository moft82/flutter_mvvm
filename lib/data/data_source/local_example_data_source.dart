import 'local_data_source.dart';
import '../../config/API.dart';
import 'package:hive/hive.dart';

class LocalExampleDataSource extends LocalDataSource {
  final String _url = API.host;

  @override
  Future<dynamic> get({required String boxName, required String dataKey}) async {
    var box = await Hive.openBox<dynamic>(boxName);
    var data = (box.get(dataKey) != null) ? box.get(dataKey)! : "1";
    return data;
  }

  @override
  Future<void> post({required String boxName, required String dataKey,  required dynamic data}) async {
    var box = await Hive.openBox<dynamic>(boxName);
    box.put(dataKey, data);
  }

  @override
  Future<void> delete({required String boxName, required String dataKey}) async {
    var box = await Hive.openBox<dynamic>(boxName);
    box.delete(dataKey);
  }

}
