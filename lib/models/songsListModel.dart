import 'package:freezed_annotation/freezed_annotation.dart';

part 'songsListModel.freezed.dart';
part 'songsListModel.g.dart';

@freezed
class SongsListModel with _$SongsListModel {
  const factory SongsListModel({
    @Default(400) @JsonKey(name: "status") int? status,
    @Default('') @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<SongsData>? data,
  }) = _SongsListModel;

  factory SongsListModel.fromJson(Map<String, dynamic> json) =>
      _$SongsListModelFromJson(json);
}

@freezed
class SongsData with _$SongsData {
  const factory SongsData({
    @Default(0) @JsonKey(name: "sound_category_id") int? soundCategoryId,
    @Default('')
    @JsonKey(name: "sound_category_name")
    String? soundCategoryName,
    @Default('')
    @JsonKey(name: "sound_category_profile")
    String? soundCategoryProfile,
    @JsonKey(name: "sound_list") List<SoundList>? soundList,
  }) = _SongsData;

  factory SongsData.fromJson(Map<String, dynamic> json) =>
      _$SongsDataFromJson(json);
}

@freezed
class SoundList with _$SoundList {
  const factory SoundList({
    @Default(0) @JsonKey(name: "sound_id") int? soundId,
    @Default(0) @JsonKey(name: "sound_category_id") int? soundCategoryId,
    @Default('') @JsonKey(name: "sound_title") String? soundTitle,
    @Default('') @JsonKey(name: "sound") String? sound,
    @Default('') @JsonKey(name: "duration") String? duration,
    @Default('') @JsonKey(name: "singer") String? singer,
    @Default('') @JsonKey(name: "sound_image") String? soundImage,
    @Default('') @JsonKey(name: "added_by") String? addedBy,
    @Default(0) @JsonKey(name: "is_deleted") int? isDeleted,
    @Default(0) @JsonKey(name: "created_by") int? createdBy,
    @Default('') @JsonKey(name: "record_label") String? recordLabel,
    @Default('') @JsonKey(name: "distribute_as") String? distributeAs,
    @Default('') @JsonKey(name: "track_name") String? trackName,
    @Default('') @JsonKey(name: "songwriter_name") String? songwriterName,
    @Default('') @JsonKey(name: "producers") String? producers,
    @Default('') @JsonKey(name: "featured_artista") String? featuredArtista,
    @Default('') @JsonKey(name: "explicit_content") String? explicitContent,
    @Default('') @JsonKey(name: "instrumental") String? instrumental,
    @Default('') @JsonKey(name: "created_at") String? createdAt,
    @Default('') @JsonKey(name: "updated_at") String? updatedAt,
  }) = _SoundList;

  factory SoundList.fromJson(Map<String, dynamic> json) =>
      _$SoundListFromJson(json);
}
