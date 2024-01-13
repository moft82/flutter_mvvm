import 'dart:convert';
import 'package:intl/intl.dart';

class Util{

  String stringEncoder({required String string}){
    return base64.encode(utf8.encode(string));
  }

  String stringDecoder({required String string}){
    return utf8.decode(base64.decode(string));
  }

  String dateTimeFormatter({required String format, required DateTime dateTime}){
    return DateFormat(format).format(dateTime);
  }

  String urlMaker({required String url, required Map<String, dynamic> body}) {
    url = '$url?';
    body.forEach((key, value) {
      var encoded = Uri.encodeComponent(value.toString());
      url = "$url$key=$encoded&";
    });
    return url.substring(0, url.length - 1);
  }

  String currencyFormatter({required int number}){
    final formatCurrency = NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);
    return formatCurrency.format(number);
  }

}