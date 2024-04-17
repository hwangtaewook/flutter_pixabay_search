import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part "../../domain/model/photo.g.dart";

@freezed
class Photo with _$Photo {
  const factory Photo({
    required int id,
    required String url,
    required String tags,
    required String largeUrl,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
