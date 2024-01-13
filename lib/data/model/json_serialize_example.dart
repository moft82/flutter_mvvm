import 'package:json_annotation/json_annotation.dart';

/// After done writing code, run "flutter pub run build_runner build" in terminal

part 'json_serialize_example.g.dart';
@JsonSerializable(explicitToJson: true)
class JsonSerializeExample{
  int id;
  String desc, camelCaseExample;

  JsonSerializeExample({required this.id, required this.desc, required this.camelCaseExample});

  factory JsonSerializeExample.fromJson(Map<String, dynamic> json){
    return _$JsonSerializeExampleFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$JsonSerializeExampleToJson(this);
  }

}