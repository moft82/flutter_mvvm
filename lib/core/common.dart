import '../config/enum.dart';

class Common{
  String assertMessage({required String widgetName, required String message}){
    return "$widgetName : $message";
  }

  List<Option> optionList(){
    return [Option.option1, Option.option2, Option.option3, Option.option4];
  }
}