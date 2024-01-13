// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serialize_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonSerializeExample _$JsonSerializeExampleFromJson(
        Map<String, dynamic> json) =>
    JsonSerializeExample(
      id: json['id'] as int,
      desc: json['desc'] as String,
      camelCaseExample: json['camelCaseExample'] as String,
    );

Map<String, dynamic> _$JsonSerializeExampleToJson(
        JsonSerializeExample instance) =>
    <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'camelCaseExample': instance.camelCaseExample,
    };
