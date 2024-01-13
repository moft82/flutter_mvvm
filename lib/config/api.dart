import 'constants.dart';

class Host{
  static const host = 'http://${Constants.serverIp}';
}

class API {
  static const host = "${Host.host}/api";
  static const remoteExample = "${Host.host}/api";
}