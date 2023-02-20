import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

/// Photo from jsonplaceholder.typicode.com/
@JsonSerializable()
class Photo extends Equatable {
  ///Constructor
  const Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  ///Get Photo from Json
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  /// Id of Photo
  final int id;
  /// Album ID
  final int albumId;
  /// Title of photo
  final String title;
  /// Url to get image
  final String url;
  /// Url to get thumbnail
  final String thumbnailUrl;

  ///Convert to Json
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object> get props {
    return [id, albumId, title, url, thumbnailUrl];
  }
}
