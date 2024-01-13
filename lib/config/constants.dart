import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants{

  final apiIp = dotenv.get('apiIp');
  final key = dotenv.get('key');

}