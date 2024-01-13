import 'remote_datasource.dart';
import '../../config/API.dart';

class RemoteExampleDataSource extends RemoteDataSource {
  final String _url = API.host;

  Future<dynamic> get({Map<String, dynamic>? body}) async {
    try {
      var response = await callAPI(method: "GET", url: _url, body: body);
      return response;
    } catch (e) {
      throw Error();
    }
  }


  Future<dynamic> post({required Map<String, dynamic> body}) async {
    try {
      var response = await callAPI(method: "POST", url: _url, body: body);
      return response;
    } catch (e) {
      throw Error();
    }
  }

  Future<dynamic> delete({required Map<String, dynamic> body}) async {
    try {
      var response = await callAPI(method: "DELETE", url: _url, body: body);
      return response;
    } catch (e) {
      throw Error();
    }
  }

  Future<dynamic> put({required Map<String, dynamic> body}) async {
    try {
      var response = await callAPI(method: "PUT", url: _url, body: body);
      return response;
    } catch (e) {
      throw Error();
    }
  }
}
