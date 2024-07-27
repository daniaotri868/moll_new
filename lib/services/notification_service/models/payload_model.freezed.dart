// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayloadModel _$PayloadModelFromJson(Map<String, dynamic> json) {
  return _PayloadModel.fromJson(json);
}

/// @nodoc
mixin _$PayloadModel {
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayloadModelCopyWith<PayloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayloadModelCopyWith<$Res> {
  factory $PayloadModelCopyWith(
          PayloadModel value, $Res Function(PayloadModel) then) =
      _$PayloadModelCopyWithImpl<$Res, PayloadModel>;
  @useResult
  $Res call({String? title, String? body});
}

/// @nodoc
class _$PayloadModelCopyWithImpl<$Res, $Val extends PayloadModel>
    implements $PayloadModelCopyWith<$Res> {
  _$PayloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayloadModelImplCopyWith<$Res>
    implements $PayloadModelCopyWith<$Res> {
  factory _$$PayloadModelImplCopyWith(
          _$PayloadModelImpl value, $Res Function(_$PayloadModelImpl) then) =
      __$$PayloadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? body});
}

/// @nodoc
class __$$PayloadModelImplCopyWithImpl<$Res>
    extends _$PayloadModelCopyWithImpl<$Res, _$PayloadModelImpl>
    implements _$$PayloadModelImplCopyWith<$Res> {
  __$$PayloadModelImplCopyWithImpl(
      _$PayloadModelImpl _value, $Res Function(_$PayloadModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$PayloadModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayloadModelImpl implements _PayloadModel {
  const _$PayloadModelImpl({this.title, this.body});

  factory _$PayloadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayloadModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? body;

  @override
  String toString() {
    return 'PayloadModel(title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayloadModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayloadModelImplCopyWith<_$PayloadModelImpl> get copyWith =>
      __$$PayloadModelImplCopyWithImpl<_$PayloadModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayloadModelImplToJson(
      this,
    );
  }
}

abstract class _PayloadModel implements PayloadModel {
  const factory _PayloadModel({final String? title, final String? body}) =
      _$PayloadModelImpl;

  factory _PayloadModel.fromJson(Map<String, dynamic> json) =
      _$PayloadModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get body;
  @override
  @JsonKey(ignore: true)
  _$$PayloadModelImplCopyWith<_$PayloadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
