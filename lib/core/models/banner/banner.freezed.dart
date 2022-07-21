// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Banner {
  String get bannerUrl => throw _privateConstructorUsedError;
  String get bannerName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerCopyWith<Banner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerCopyWith<$Res> {
  factory $BannerCopyWith(Banner value, $Res Function(Banner) then) =
      _$BannerCopyWithImpl<$Res>;
  $Res call({String bannerUrl, String bannerName});
}

/// @nodoc
class _$BannerCopyWithImpl<$Res> implements $BannerCopyWith<$Res> {
  _$BannerCopyWithImpl(this._value, this._then);

  final Banner _value;
  // ignore: unused_field
  final $Res Function(Banner) _then;

  @override
  $Res call({
    Object? bannerUrl = freezed,
    Object? bannerName = freezed,
  }) {
    return _then(_value.copyWith(
      bannerUrl: bannerUrl == freezed
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerName: bannerName == freezed
          ? _value.bannerName
          : bannerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BannerCopyWith<$Res> implements $BannerCopyWith<$Res> {
  factory _$$_BannerCopyWith(_$_Banner value, $Res Function(_$_Banner) then) =
      __$$_BannerCopyWithImpl<$Res>;
  @override
  $Res call({String bannerUrl, String bannerName});
}

/// @nodoc
class __$$_BannerCopyWithImpl<$Res> extends _$BannerCopyWithImpl<$Res>
    implements _$$_BannerCopyWith<$Res> {
  __$$_BannerCopyWithImpl(_$_Banner _value, $Res Function(_$_Banner) _then)
      : super(_value, (v) => _then(v as _$_Banner));

  @override
  _$_Banner get _value => super._value as _$_Banner;

  @override
  $Res call({
    Object? bannerUrl = freezed,
    Object? bannerName = freezed,
  }) {
    return _then(_$_Banner(
      bannerUrl: bannerUrl == freezed
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerName: bannerName == freezed
          ? _value.bannerName
          : bannerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Banner extends _Banner with DiagnosticableTreeMixin {
  const _$_Banner({required this.bannerUrl, required this.bannerName})
      : super._();

  @override
  final String bannerUrl;
  @override
  final String bannerName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Banner(bannerUrl: $bannerUrl, bannerName: $bannerName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Banner'))
      ..add(DiagnosticsProperty('bannerUrl', bannerUrl))
      ..add(DiagnosticsProperty('bannerName', bannerName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Banner &&
            const DeepCollectionEquality().equals(other.bannerUrl, bannerUrl) &&
            const DeepCollectionEquality()
                .equals(other.bannerName, bannerName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bannerUrl),
      const DeepCollectionEquality().hash(bannerName));

  @JsonKey(ignore: true)
  @override
  _$$_BannerCopyWith<_$_Banner> get copyWith =>
      __$$_BannerCopyWithImpl<_$_Banner>(this, _$identity);
}

abstract class _Banner extends Banner {
  const factory _Banner(
      {required final String bannerUrl,
      required final String bannerName}) = _$_Banner;
  const _Banner._() : super._();

  @override
  String get bannerUrl;
  @override
  String get bannerName;
  @override
  @JsonKey(ignore: true)
  _$$_BannerCopyWith<_$_Banner> get copyWith =>
      throw _privateConstructorUsedError;
}
