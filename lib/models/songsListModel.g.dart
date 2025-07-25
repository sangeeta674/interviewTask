// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songsListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongsListModelImpl _$$SongsListModelImplFromJson(Map<String, dynamic> json) =>
    _$SongsListModelImpl(
      status: (json['status'] as num?)?.toInt() ?? 400,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SongsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongsListModelImplToJson(
  _$SongsListModelImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$SongsDataImpl _$$SongsDataImplFromJson(Map<String, dynamic> json) =>
    _$SongsDataImpl(
      soundCategoryId: (json['sound_category_id'] as num?)?.toInt() ?? 0,
      soundCategoryName: json['sound_category_name'] as String? ?? '',
      soundCategoryProfile: json['sound_category_profile'] as String? ?? '',
      soundList: (json['sound_list'] as List<dynamic>?)
          ?.map((e) => SoundList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongsDataImplToJson(_$SongsDataImpl instance) =>
    <String, dynamic>{
      'sound_category_id': instance.soundCategoryId,
      'sound_category_name': instance.soundCategoryName,
      'sound_category_profile': instance.soundCategoryProfile,
      'sound_list': instance.soundList,
    };

_$SoundListImpl _$$SoundListImplFromJson(Map<String, dynamic> json) =>
    _$SoundListImpl(
      soundId: (json['sound_id'] as num?)?.toInt() ?? 0,
      soundCategoryId: (json['sound_category_id'] as num?)?.toInt() ?? 0,
      soundTitle: json['sound_title'] as String? ?? '',
      sound: json['sound'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      singer: json['singer'] as String? ?? '',
      soundImage: json['sound_image'] as String? ?? '',
      addedBy: json['added_by'] as String? ?? '',
      isDeleted: (json['is_deleted'] as num?)?.toInt() ?? 0,
      createdBy: (json['created_by'] as num?)?.toInt() ?? 0,
      recordLabel: json['record_label'] as String? ?? '',
      distributeAs: json['distribute_as'] as String? ?? '',
      trackName: json['track_name'] as String? ?? '',
      songwriterName: json['songwriter_name'] as String? ?? '',
      producers: json['producers'] as String? ?? '',
      featuredArtista: json['featured_artista'] as String? ?? '',
      explicitContent: json['explicit_content'] as String? ?? '',
      instrumental: json['instrumental'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$$SoundListImplToJson(_$SoundListImpl instance) =>
    <String, dynamic>{
      'sound_id': instance.soundId,
      'sound_category_id': instance.soundCategoryId,
      'sound_title': instance.soundTitle,
      'sound': instance.sound,
      'duration': instance.duration,
      'singer': instance.singer,
      'sound_image': instance.soundImage,
      'added_by': instance.addedBy,
      'is_deleted': instance.isDeleted,
      'created_by': instance.createdBy,
      'record_label': instance.recordLabel,
      'distribute_as': instance.distributeAs,
      'track_name': instance.trackName,
      'songwriter_name': instance.songwriterName,
      'producers': instance.producers,
      'featured_artista': instance.featuredArtista,
      'explicit_content': instance.explicitContent,
      'instrumental': instance.instrumental,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
