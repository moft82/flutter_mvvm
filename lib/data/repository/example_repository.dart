import 'package:flutter_mvvm/data/datasource/remote_example_datasource.dart';
import 'package:flutter_mvvm/data/model/example.dart';
import 'package:logger/logger.dart';

class ExampleRepository{
  final RemoteExampleDataSource _remoteDataSource = RemoteExampleDataSource();
  Logger logger = Logger();

  Future<List<Example>> get({required int id}) async {
    var body = {
      "id" :id
    };
    List<Example> result = [];
    var data = await _remoteDataSource.get(body: body);
    // logger.d(data);
    data.forEach((d) {
      result.add(Example.fromJson(d));
    });
    logger.d(data);
    return result;
  }

  Future<void> post({required int id}) async{
    Map<String, dynamic> body = {"id" : id};
    await _remoteDataSource.post(body : body);
  }

  Future<void> put({required int id}) async{
    Map<String, dynamic> body = {"id" : id};
    await _remoteDataSource.put(body : body);
  }


  Future<void> delete({required int id}) async{
    Map<String, dynamic> body = {"id" : id};
    await _remoteDataSource.delete(body : body);
  }

}