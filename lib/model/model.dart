import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class ListOfNote {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? id;

  final String name;
  final String snippet;
  final DateTime timestamp;

  ListOfNote({
    this.id, 
    required this.name, 
    required this.snippet, 
    required this.timestamp
  });

  factory ListOfNote.fromJson(Map<String, dynamic> json) => _$ListOfNoteFromJson(json);
  Map<String, dynamic> toJson() => _$ListOfNoteToJson(this);
}