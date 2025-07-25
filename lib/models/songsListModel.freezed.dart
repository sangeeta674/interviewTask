// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songsListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SongsListModel _$SongsListModelFromJson(Map<String, dynamic> json) {
  return _SongsListModel.fromJson(json);
}

/// @nodoc
mixin _$SongsListModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<SongsData>? get data => throw _privateConstructorUsedError;

  /// Serializes this SongsListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SongsListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SongsListModelCopyWith<SongsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsListModelCopyWith<$Res> {
  factory $SongsListModelCopyWith(
    SongsListModel value,
    $Res Function(SongsListModel) then,
  ) = _$SongsListModelCopyWithImpl<$Res, SongsListModel>;
  @useResult
  $Res call({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<SongsData>? data,
  });
}

/// @nodoc
class _$SongsListModelCopyWithImpl<$Res, $Val extends SongsListModel>
    implements $SongsListModelCopyWith<$Res> {
  _$SongsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SongsListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<SongsData>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SongsListModelImplCopyWith<$Res>
    implements $SongsListModelCopyWith<$Res> {
  factory _$$SongsListModelImplCopyWith(
    _$SongsListModelImpl value,
    $Res Function(_$SongsListModelImpl) then,
  ) = __$$SongsListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<SongsData>? data,
  });
}

/// @nodoc
class __$$SongsListModelImplCopyWithImpl<$Res>
    extends _$SongsListModelCopyWithImpl<$Res, _$SongsListModelImpl>
    implements _$$SongsListModelImplCopyWith<$Res> {
  __$$SongsListModelImplCopyWithImpl(
    _$SongsListModelImpl _value,
    $Res Function(_$SongsListModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SongsListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$SongsListModelImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SongsData>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SongsListModelImpl implements _SongsListModel {
  const _$SongsListModelImpl({
    @JsonKey(name: "status") this.status = 400,
    @JsonKey(name: "message") this.message = '',
    @JsonKey(name: "data") final List<SongsData>? data,
  }) : _data = data;

  factory _$SongsListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongsListModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<SongsData>? _data;
  @override
  @JsonKey(name: "data")
  List<SongsData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongsListModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongsListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    message,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of SongsListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongsListModelImplCopyWith<_$SongsListModelImpl> get copyWith =>
      __$$SongsListModelImplCopyWithImpl<_$SongsListModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SongsListModelImplToJson(this);
  }
}

abstract class _SongsListModel implements SongsListModel {
  const factory _SongsListModel({
    @JsonKey(name: "status") final int? status,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "data") final List<SongsData>? data,
  }) = _$SongsListModelImpl;

  factory _SongsListModel.fromJson(Map<String, dynamic> json) =
      _$SongsListModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  List<SongsData>? get data;

  /// Create a copy of SongsListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongsListModelImplCopyWith<_$SongsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SongsData _$SongsDataFromJson(Map<String, dynamic> json) {
  return _SongsData.fromJson(json);
}

/// @nodoc
mixin _$SongsData {
  @JsonKey(name: "sound_category_id")
  int? get soundCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "sound_category_name")
  String? get soundCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "sound_category_profile")
  String? get soundCategoryProfile => throw _privateConstructorUsedError;
  @JsonKey(name: "sound_list")
  List<SoundList>? get soundList => throw _privateConstructorUsedError;

  /// Serializes this SongsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SongsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SongsDataCopyWith<SongsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsDataCopyWith<$Res> {
  factory $SongsDataCopyWith(SongsData value, $Res Function(SongsData) then) =
      _$SongsDataCopyWithImpl<$Res, SongsData>;
  @useResult
  $Res call({
    @JsonKey(name: "sound_category_id") int? soundCategoryId,
    @JsonKey(name: "sound_category_name") String? soundCategoryName,
    @JsonKey(name: "sound_category_profile") String? soundCategoryProfile,
    @JsonKey(name: "sound_list") List<SoundList>? soundList,
  });
}

/// @nodoc
class _$SongsDataCopyWithImpl<$Res, $Val extends SongsData>
    implements $SongsDataCopyWith<$Res> {
  _$SongsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SongsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundCategoryId = freezed,
    Object? soundCategoryName = freezed,
    Object? soundCategoryProfile = freezed,
    Object? soundList = freezed,
  }) {
    return _then(
      _value.copyWith(
            soundCategoryId: freezed == soundCategoryId
                ? _value.soundCategoryId
                : soundCategoryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            soundCategoryName: freezed == soundCategoryName
                ? _value.soundCategoryName
                : soundCategoryName // ignore: cast_nullable_to_non_nullable
                      as String?,
            soundCategoryProfile: freezed == soundCategoryProfile
                ? _value.soundCategoryProfile
                : soundCategoryProfile // ignore: cast_nullable_to_non_nullable
                      as String?,
            soundList: freezed == soundList
                ? _value.soundList
                : soundList // ignore: cast_nullable_to_non_nullable
                      as List<SoundList>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SongsDataImplCopyWith<$Res>
    implements $SongsDataCopyWith<$Res> {
  factory _$$SongsDataImplCopyWith(
    _$SongsDataImpl value,
    $Res Function(_$SongsDataImpl) then,
  ) = __$$SongsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "sound_category_id") int? soundCategoryId,
    @JsonKey(name: "sound_category_name") String? soundCategoryName,
    @JsonKey(name: "sound_category_profile") String? soundCategoryProfile,
    @JsonKey(name: "sound_list") List<SoundList>? soundList,
  });
}

/// @nodoc
class __$$SongsDataImplCopyWithImpl<$Res>
    extends _$SongsDataCopyWithImpl<$Res, _$SongsDataImpl>
    implements _$$SongsDataImplCopyWith<$Res> {
  __$$SongsDataImplCopyWithImpl(
    _$SongsDataImpl _value,
    $Res Function(_$SongsDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SongsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundCategoryId = freezed,
    Object? soundCategoryName = freezed,
    Object? soundCategoryProfile = freezed,
    Object? soundList = freezed,
  }) {
    return _then(
      _$SongsDataImpl(
        soundCategoryId: freezed == soundCategoryId
            ? _value.soundCategoryId
            : soundCategoryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        soundCategoryName: freezed == soundCategoryName
            ? _value.soundCategoryName
            : soundCategoryName // ignore: cast_nullable_to_non_nullable
                  as String?,
        soundCategoryProfile: freezed == soundCategoryProfile
            ? _value.soundCategoryProfile
            : soundCategoryProfile // ignore: cast_nullable_to_non_nullable
                  as String?,
        soundList: freezed == soundList
            ? _value._soundList
            : soundList // ignore: cast_nullable_to_non_nullable
                  as List<SoundList>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SongsDataImpl implements _SongsData {
  const _$SongsDataImpl({
    @JsonKey(name: "sound_category_id") this.soundCategoryId = 0,
    @JsonKey(name: "sound_category_name") this.soundCategoryName = '',
    @JsonKey(name: "sound_category_profile") this.soundCategoryProfile = '',
    @JsonKey(name: "sound_list") final List<SoundList>? soundList,
  }) : _soundList = soundList;

  factory _$SongsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongsDataImplFromJson(json);

  @override
  @JsonKey(name: "sound_category_id")
  final int? soundCategoryId;
  @override
  @JsonKey(name: "sound_category_name")
  final String? soundCategoryName;
  @override
  @JsonKey(name: "sound_category_profile")
  final String? soundCategoryProfile;
  final List<SoundList>? _soundList;
  @override
  @JsonKey(name: "sound_list")
  List<SoundList>? get soundList {
    final value = _soundList;
    if (value == null) return null;
    if (_soundList is EqualUnmodifiableListView) return _soundList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SongsData(soundCategoryId: $soundCategoryId, soundCategoryName: $soundCategoryName, soundCategoryProfile: $soundCategoryProfile, soundList: $soundList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongsDataImpl &&
            (identical(other.soundCategoryId, soundCategoryId) ||
                other.soundCategoryId == soundCategoryId) &&
            (identical(other.soundCategoryName, soundCategoryName) ||
                other.soundCategoryName == soundCategoryName) &&
            (identical(other.soundCategoryProfile, soundCategoryProfile) ||
                other.soundCategoryProfile == soundCategoryProfile) &&
            const DeepCollectionEquality().equals(
              other._soundList,
              _soundList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    soundCategoryId,
    soundCategoryName,
    soundCategoryProfile,
    const DeepCollectionEquality().hash(_soundList),
  );

  /// Create a copy of SongsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongsDataImplCopyWith<_$SongsDataImpl> get copyWith =>
      __$$SongsDataImplCopyWithImpl<_$SongsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongsDataImplToJson(this);
  }
}

abstract class _SongsData implements SongsData {
  const factory _SongsData({
    @JsonKey(name: "sound_category_id") final int? soundCategoryId,
    @JsonKey(name: "sound_category_name") final String? soundCategoryName,
    @JsonKey(name: "sound_category_profile") final String? soundCategoryProfile,
    @JsonKey(name: "sound_list") final List<SoundList>? soundList,
  }) = _$SongsDataImpl;

  factory _SongsData.fromJson(Map<String, dynamic> json) =
      _$SongsDataImpl.fromJson;

  @override
  @JsonKey(name: "sound_category_id")
  int? get soundCategoryId;
  @override
  @JsonKey(name: "sound_category_name")
  String? get soundCategoryName;
  @override
  @JsonKey(name: "sound_category_profile")
  String? get soundCategoryProfile;
  @override
  @JsonKey(name: "sound_list")
  List<SoundList>? get soundList;

  /// Create a copy of SongsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongsDataImplCopyWith<_$SongsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SoundList _$SoundListFromJson(Map<String, dynamic> json) {
  return _SoundList.fromJson(json);
}

/// @nodoc
mixin _$SoundList {
  @JsonKey(name: "sound_id")
  int? get soundId => throw _privateConstructorUsedError;
  @JsonKey(name: "sound_category_id")
  int? get soundCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "sound_title")
  String? get soundTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "sound")
  String? get sound => throw _privateConstructorUsedError;
  @JsonKey(name: "duration")
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "singer")
  String? get singer => throw _privateConstructorUsedError;
  @JsonKey(name: "sound_image")
  String? get soundImage => throw _privateConstructorUsedError;
  @JsonKey(name: "added_by")
  String? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "is_deleted")
  int? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  int? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "record_label")
  String? get recordLabel => throw _privateConstructorUsedError;
  @JsonKey(name: "distribute_as")
  String? get distributeAs => throw _privateConstructorUsedError;
  @JsonKey(name: "track_name")
  String? get trackName => throw _privateConstructorUsedError;
  @JsonKey(name: "songwriter_name")
  String? get songwriterName => throw _privateConstructorUsedError;
  @JsonKey(name: "producers")
  String? get producers => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_artista")
  String? get featuredArtista => throw _privateConstructorUsedError;
  @JsonKey(name: "explicit_content")
  String? get explicitContent => throw _privateConstructorUsedError;
  @JsonKey(name: "instrumental")
  String? get instrumental => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SoundList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoundList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoundListCopyWith<SoundList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundListCopyWith<$Res> {
  factory $SoundListCopyWith(SoundList value, $Res Function(SoundList) then) =
      _$SoundListCopyWithImpl<$Res, SoundList>;
  @useResult
  $Res call({
    @JsonKey(name: "sound_id") int? soundId,
    @JsonKey(name: "sound_category_id") int? soundCategoryId,
    @JsonKey(name: "sound_title") String? soundTitle,
    @JsonKey(name: "sound") String? sound,
    @JsonKey(name: "duration") String? duration,
    @JsonKey(name: "singer") String? singer,
    @JsonKey(name: "sound_image") String? soundImage,
    @JsonKey(name: "added_by") String? addedBy,
    @JsonKey(name: "is_deleted") int? isDeleted,
    @JsonKey(name: "created_by") int? createdBy,
    @JsonKey(name: "record_label") String? recordLabel,
    @JsonKey(name: "distribute_as") String? distributeAs,
    @JsonKey(name: "track_name") String? trackName,
    @JsonKey(name: "songwriter_name") String? songwriterName,
    @JsonKey(name: "producers") String? producers,
    @JsonKey(name: "featured_artista") String? featuredArtista,
    @JsonKey(name: "explicit_content") String? explicitContent,
    @JsonKey(name: "instrumental") String? instrumental,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  });
}

/// @nodoc
class _$SoundListCopyWithImpl<$Res, $Val extends SoundList>
    implements $SoundListCopyWith<$Res> {
  _$SoundListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoundList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundId = freezed,
    Object? soundCategoryId = freezed,
    Object? soundTitle = freezed,
    Object? sound = freezed,
    Object? duration = freezed,
    Object? singer = freezed,
    Object? soundImage = freezed,
    Object? addedBy = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? recordLabel = freezed,
    Object? distributeAs = freezed,
    Object? trackName = freezed,
    Object? songwriterName = freezed,
    Object? producers = freezed,
    Object? featuredArtista = freezed,
    Object? explicitContent = freezed,
    Object? instrumental = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            soundId: freezed == soundId
                ? _value.soundId
                : soundId // ignore: cast_nullable_to_non_nullable
                      as int?,
            soundCategoryId: freezed == soundCategoryId
                ? _value.soundCategoryId
                : soundCategoryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            soundTitle: freezed == soundTitle
                ? _value.soundTitle
                : soundTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            sound: freezed == sound
                ? _value.sound
                : sound // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            singer: freezed == singer
                ? _value.singer
                : singer // ignore: cast_nullable_to_non_nullable
                      as String?,
            soundImage: freezed == soundImage
                ? _value.soundImage
                : soundImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            addedBy: freezed == addedBy
                ? _value.addedBy
                : addedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDeleted: freezed == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as int?,
            recordLabel: freezed == recordLabel
                ? _value.recordLabel
                : recordLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            distributeAs: freezed == distributeAs
                ? _value.distributeAs
                : distributeAs // ignore: cast_nullable_to_non_nullable
                      as String?,
            trackName: freezed == trackName
                ? _value.trackName
                : trackName // ignore: cast_nullable_to_non_nullable
                      as String?,
            songwriterName: freezed == songwriterName
                ? _value.songwriterName
                : songwriterName // ignore: cast_nullable_to_non_nullable
                      as String?,
            producers: freezed == producers
                ? _value.producers
                : producers // ignore: cast_nullable_to_non_nullable
                      as String?,
            featuredArtista: freezed == featuredArtista
                ? _value.featuredArtista
                : featuredArtista // ignore: cast_nullable_to_non_nullable
                      as String?,
            explicitContent: freezed == explicitContent
                ? _value.explicitContent
                : explicitContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            instrumental: freezed == instrumental
                ? _value.instrumental
                : instrumental // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SoundListImplCopyWith<$Res>
    implements $SoundListCopyWith<$Res> {
  factory _$$SoundListImplCopyWith(
    _$SoundListImpl value,
    $Res Function(_$SoundListImpl) then,
  ) = __$$SoundListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "sound_id") int? soundId,
    @JsonKey(name: "sound_category_id") int? soundCategoryId,
    @JsonKey(name: "sound_title") String? soundTitle,
    @JsonKey(name: "sound") String? sound,
    @JsonKey(name: "duration") String? duration,
    @JsonKey(name: "singer") String? singer,
    @JsonKey(name: "sound_image") String? soundImage,
    @JsonKey(name: "added_by") String? addedBy,
    @JsonKey(name: "is_deleted") int? isDeleted,
    @JsonKey(name: "created_by") int? createdBy,
    @JsonKey(name: "record_label") String? recordLabel,
    @JsonKey(name: "distribute_as") String? distributeAs,
    @JsonKey(name: "track_name") String? trackName,
    @JsonKey(name: "songwriter_name") String? songwriterName,
    @JsonKey(name: "producers") String? producers,
    @JsonKey(name: "featured_artista") String? featuredArtista,
    @JsonKey(name: "explicit_content") String? explicitContent,
    @JsonKey(name: "instrumental") String? instrumental,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  });
}

/// @nodoc
class __$$SoundListImplCopyWithImpl<$Res>
    extends _$SoundListCopyWithImpl<$Res, _$SoundListImpl>
    implements _$$SoundListImplCopyWith<$Res> {
  __$$SoundListImplCopyWithImpl(
    _$SoundListImpl _value,
    $Res Function(_$SoundListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SoundList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soundId = freezed,
    Object? soundCategoryId = freezed,
    Object? soundTitle = freezed,
    Object? sound = freezed,
    Object? duration = freezed,
    Object? singer = freezed,
    Object? soundImage = freezed,
    Object? addedBy = freezed,
    Object? isDeleted = freezed,
    Object? createdBy = freezed,
    Object? recordLabel = freezed,
    Object? distributeAs = freezed,
    Object? trackName = freezed,
    Object? songwriterName = freezed,
    Object? producers = freezed,
    Object? featuredArtista = freezed,
    Object? explicitContent = freezed,
    Object? instrumental = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$SoundListImpl(
        soundId: freezed == soundId
            ? _value.soundId
            : soundId // ignore: cast_nullable_to_non_nullable
                  as int?,
        soundCategoryId: freezed == soundCategoryId
            ? _value.soundCategoryId
            : soundCategoryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        soundTitle: freezed == soundTitle
            ? _value.soundTitle
            : soundTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        sound: freezed == sound
            ? _value.sound
            : sound // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        singer: freezed == singer
            ? _value.singer
            : singer // ignore: cast_nullable_to_non_nullable
                  as String?,
        soundImage: freezed == soundImage
            ? _value.soundImage
            : soundImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        addedBy: freezed == addedBy
            ? _value.addedBy
            : addedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDeleted: freezed == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as int?,
        recordLabel: freezed == recordLabel
            ? _value.recordLabel
            : recordLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        distributeAs: freezed == distributeAs
            ? _value.distributeAs
            : distributeAs // ignore: cast_nullable_to_non_nullable
                  as String?,
        trackName: freezed == trackName
            ? _value.trackName
            : trackName // ignore: cast_nullable_to_non_nullable
                  as String?,
        songwriterName: freezed == songwriterName
            ? _value.songwriterName
            : songwriterName // ignore: cast_nullable_to_non_nullable
                  as String?,
        producers: freezed == producers
            ? _value.producers
            : producers // ignore: cast_nullable_to_non_nullable
                  as String?,
        featuredArtista: freezed == featuredArtista
            ? _value.featuredArtista
            : featuredArtista // ignore: cast_nullable_to_non_nullable
                  as String?,
        explicitContent: freezed == explicitContent
            ? _value.explicitContent
            : explicitContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        instrumental: freezed == instrumental
            ? _value.instrumental
            : instrumental // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SoundListImpl implements _SoundList {
  const _$SoundListImpl({
    @JsonKey(name: "sound_id") this.soundId = 0,
    @JsonKey(name: "sound_category_id") this.soundCategoryId = 0,
    @JsonKey(name: "sound_title") this.soundTitle = '',
    @JsonKey(name: "sound") this.sound = '',
    @JsonKey(name: "duration") this.duration = '',
    @JsonKey(name: "singer") this.singer = '',
    @JsonKey(name: "sound_image") this.soundImage = '',
    @JsonKey(name: "added_by") this.addedBy = '',
    @JsonKey(name: "is_deleted") this.isDeleted = 0,
    @JsonKey(name: "created_by") this.createdBy = 0,
    @JsonKey(name: "record_label") this.recordLabel = '',
    @JsonKey(name: "distribute_as") this.distributeAs = '',
    @JsonKey(name: "track_name") this.trackName = '',
    @JsonKey(name: "songwriter_name") this.songwriterName = '',
    @JsonKey(name: "producers") this.producers = '',
    @JsonKey(name: "featured_artista") this.featuredArtista = '',
    @JsonKey(name: "explicit_content") this.explicitContent = '',
    @JsonKey(name: "instrumental") this.instrumental = '',
    @JsonKey(name: "created_at") this.createdAt = '',
    @JsonKey(name: "updated_at") this.updatedAt = '',
  });

  factory _$SoundListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoundListImplFromJson(json);

  @override
  @JsonKey(name: "sound_id")
  final int? soundId;
  @override
  @JsonKey(name: "sound_category_id")
  final int? soundCategoryId;
  @override
  @JsonKey(name: "sound_title")
  final String? soundTitle;
  @override
  @JsonKey(name: "sound")
  final String? sound;
  @override
  @JsonKey(name: "duration")
  final String? duration;
  @override
  @JsonKey(name: "singer")
  final String? singer;
  @override
  @JsonKey(name: "sound_image")
  final String? soundImage;
  @override
  @JsonKey(name: "added_by")
  final String? addedBy;
  @override
  @JsonKey(name: "is_deleted")
  final int? isDeleted;
  @override
  @JsonKey(name: "created_by")
  final int? createdBy;
  @override
  @JsonKey(name: "record_label")
  final String? recordLabel;
  @override
  @JsonKey(name: "distribute_as")
  final String? distributeAs;
  @override
  @JsonKey(name: "track_name")
  final String? trackName;
  @override
  @JsonKey(name: "songwriter_name")
  final String? songwriterName;
  @override
  @JsonKey(name: "producers")
  final String? producers;
  @override
  @JsonKey(name: "featured_artista")
  final String? featuredArtista;
  @override
  @JsonKey(name: "explicit_content")
  final String? explicitContent;
  @override
  @JsonKey(name: "instrumental")
  final String? instrumental;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'SoundList(soundId: $soundId, soundCategoryId: $soundCategoryId, soundTitle: $soundTitle, sound: $sound, duration: $duration, singer: $singer, soundImage: $soundImage, addedBy: $addedBy, isDeleted: $isDeleted, createdBy: $createdBy, recordLabel: $recordLabel, distributeAs: $distributeAs, trackName: $trackName, songwriterName: $songwriterName, producers: $producers, featuredArtista: $featuredArtista, explicitContent: $explicitContent, instrumental: $instrumental, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoundListImpl &&
            (identical(other.soundId, soundId) || other.soundId == soundId) &&
            (identical(other.soundCategoryId, soundCategoryId) ||
                other.soundCategoryId == soundCategoryId) &&
            (identical(other.soundTitle, soundTitle) ||
                other.soundTitle == soundTitle) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.singer, singer) || other.singer == singer) &&
            (identical(other.soundImage, soundImage) ||
                other.soundImage == soundImage) &&
            (identical(other.addedBy, addedBy) || other.addedBy == addedBy) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.recordLabel, recordLabel) ||
                other.recordLabel == recordLabel) &&
            (identical(other.distributeAs, distributeAs) ||
                other.distributeAs == distributeAs) &&
            (identical(other.trackName, trackName) ||
                other.trackName == trackName) &&
            (identical(other.songwriterName, songwriterName) ||
                other.songwriterName == songwriterName) &&
            (identical(other.producers, producers) ||
                other.producers == producers) &&
            (identical(other.featuredArtista, featuredArtista) ||
                other.featuredArtista == featuredArtista) &&
            (identical(other.explicitContent, explicitContent) ||
                other.explicitContent == explicitContent) &&
            (identical(other.instrumental, instrumental) ||
                other.instrumental == instrumental) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    soundId,
    soundCategoryId,
    soundTitle,
    sound,
    duration,
    singer,
    soundImage,
    addedBy,
    isDeleted,
    createdBy,
    recordLabel,
    distributeAs,
    trackName,
    songwriterName,
    producers,
    featuredArtista,
    explicitContent,
    instrumental,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of SoundList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoundListImplCopyWith<_$SoundListImpl> get copyWith =>
      __$$SoundListImplCopyWithImpl<_$SoundListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoundListImplToJson(this);
  }
}

abstract class _SoundList implements SoundList {
  const factory _SoundList({
    @JsonKey(name: "sound_id") final int? soundId,
    @JsonKey(name: "sound_category_id") final int? soundCategoryId,
    @JsonKey(name: "sound_title") final String? soundTitle,
    @JsonKey(name: "sound") final String? sound,
    @JsonKey(name: "duration") final String? duration,
    @JsonKey(name: "singer") final String? singer,
    @JsonKey(name: "sound_image") final String? soundImage,
    @JsonKey(name: "added_by") final String? addedBy,
    @JsonKey(name: "is_deleted") final int? isDeleted,
    @JsonKey(name: "created_by") final int? createdBy,
    @JsonKey(name: "record_label") final String? recordLabel,
    @JsonKey(name: "distribute_as") final String? distributeAs,
    @JsonKey(name: "track_name") final String? trackName,
    @JsonKey(name: "songwriter_name") final String? songwriterName,
    @JsonKey(name: "producers") final String? producers,
    @JsonKey(name: "featured_artista") final String? featuredArtista,
    @JsonKey(name: "explicit_content") final String? explicitContent,
    @JsonKey(name: "instrumental") final String? instrumental,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "updated_at") final String? updatedAt,
  }) = _$SoundListImpl;

  factory _SoundList.fromJson(Map<String, dynamic> json) =
      _$SoundListImpl.fromJson;

  @override
  @JsonKey(name: "sound_id")
  int? get soundId;
  @override
  @JsonKey(name: "sound_category_id")
  int? get soundCategoryId;
  @override
  @JsonKey(name: "sound_title")
  String? get soundTitle;
  @override
  @JsonKey(name: "sound")
  String? get sound;
  @override
  @JsonKey(name: "duration")
  String? get duration;
  @override
  @JsonKey(name: "singer")
  String? get singer;
  @override
  @JsonKey(name: "sound_image")
  String? get soundImage;
  @override
  @JsonKey(name: "added_by")
  String? get addedBy;
  @override
  @JsonKey(name: "is_deleted")
  int? get isDeleted;
  @override
  @JsonKey(name: "created_by")
  int? get createdBy;
  @override
  @JsonKey(name: "record_label")
  String? get recordLabel;
  @override
  @JsonKey(name: "distribute_as")
  String? get distributeAs;
  @override
  @JsonKey(name: "track_name")
  String? get trackName;
  @override
  @JsonKey(name: "songwriter_name")
  String? get songwriterName;
  @override
  @JsonKey(name: "producers")
  String? get producers;
  @override
  @JsonKey(name: "featured_artista")
  String? get featuredArtista;
  @override
  @JsonKey(name: "explicit_content")
  String? get explicitContent;
  @override
  @JsonKey(name: "instrumental")
  String? get instrumental;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;

  /// Create a copy of SoundList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoundListImplCopyWith<_$SoundListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
