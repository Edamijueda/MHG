// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Device {
  String get url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get customTitle => throw _privateConstructorUsedError;
  String? get deviceType => throw _privateConstructorUsedError;
  set deviceType(String? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res>;
  $Res call(
      {String url,
      String title,
      String description,
      String price,
      String? customTitle,
      String? deviceType,
      String? id});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res> implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  final Device _value;
  // ignore: unused_field
  final $Res Function(Device) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? customTitle = freezed,
    Object? deviceType = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      customTitle: customTitle == freezed
          ? _value.customTitle
          : customTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$_DeviceCopyWith(_$_Device value, $Res Function(_$_Device) then) =
      __$$_DeviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String url,
      String title,
      String description,
      String price,
      String? customTitle,
      String? deviceType,
      String? id});
}

/// @nodoc
class __$$_DeviceCopyWithImpl<$Res> extends _$DeviceCopyWithImpl<$Res>
    implements _$$_DeviceCopyWith<$Res> {
  __$$_DeviceCopyWithImpl(_$_Device _value, $Res Function(_$_Device) _then)
      : super(_value, (v) => _then(v as _$_Device));

  @override
  _$_Device get _value => super._value as _$_Device;

  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? customTitle = freezed,
    Object? deviceType = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Device(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      customTitle: customTitle == freezed
          ? _value.customTitle
          : customTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Device extends _Device {
  _$_Device(
      {required this.url,
      required this.title,
      required this.description,
      required this.price,
      this.customTitle,
      this.deviceType,
      this.id})
      : super._();

  @override
  final String url;
  @override
  final String title;
  @override
  final String description;
  @override
  final String price;
  @override
  final String? customTitle;
  @override
  String? deviceType;
  @override
  final String? id;

  @override
  String toString() {
    return 'Device(url: $url, title: $title, description: $description, price: $price, customTitle: $customTitle, deviceType: $deviceType, id: $id)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      __$$_DeviceCopyWithImpl<_$_Device>(this, _$identity);
}

abstract class _Device extends Device {
  factory _Device(
      {required final String url,
      required final String title,
      required final String description,
      required final String price,
      final String? customTitle,
      String? deviceType,
      final String? id}) = _$_Device;
  _Device._() : super._();

  @override
  String get url;
  @override
  String get title;
  @override
  String get description;
  @override
  String get price;
  @override
  String? get customTitle;
  @override
  String? get deviceType;
  set deviceType(String? value);
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      throw _privateConstructorUsedError;
}
