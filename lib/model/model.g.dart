// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfNote _$ListOfNoteFromJson(Map<String, dynamic> json) => ListOfNote(
  name: json['name'] as String,
  snippet: json['snippet'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ListOfNoteToJson(ListOfNote instance) =>
    <String, dynamic>{
      'name': instance.name,
      'snippet': instance.snippet,
      'timestamp': instance.timestamp.toIso8601String(),
    };
