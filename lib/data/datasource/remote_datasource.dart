import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../../core/util.dart';

class RemoteDataSource {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  Util util = Util();

  Future<dynamic> callAPI(
      {required String method,
        required String url,
        Map<String, dynamic>? body}) async {
    late dynamic response;
    Uri uri = Uri.parse(url);
    try {
      switch (method) {
        case "GET":
          if (body != null) {
            url = util.urlMaker(url: url, body: body);
            uri = Uri.parse(url);
          }
          else{
            uri = Uri.parse(url);
          }
          response = await http.get(uri);
          break;
        case "POST":
          response = await http.post(uri, body: jsonEncode(body));
          break;
        case "PUT":
          response = await http.put(uri, body: jsonEncode(body));
          break;
        case "DELETE":
          response = await http.delete(uri, body: jsonEncode(body));
          break;
        default:
          throw Error();
      }
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        // logger.d(responseBody);
        return responseBody;
      } else {
        logger.d('API status is not 200, Status Code : $statusCode');
        throw Error();
      }
    } catch (e) {
      // var responseBody = jsonDecode(response.body);
      // logger.d(responseBody);
      logger.d('API FAILED, Error : $e');
      throw Error();
    }
  }
}
