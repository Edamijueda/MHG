// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artwork.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Artwork {
  String? get url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get customTitle => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtworkCopyWith<Artwork> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCopyWith<$Res> {
  factory $ArtworkCopyWith(Artwork value, $Res Function(Artwork) then) =
      _$ArtworkCopyWithImpl<$Res>;
  $Res call(
      {String? url,
      String? title,
      String? description,
      String? price,
      String? customTitle,
      String? id});
}

/// @nodoc
class _$ArtworkCopyWithImpl<$Res> implements $ArtworkCopyWith<$Res> {
  _$ArtworkCopyWithImpl(this._value, this._then);

  final Artwork _value;
  // ignore: unused_field
  final $Res Function(Artwork) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? customTitle = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      customTitle: customTitle == freezed
          ? _value.customTitle
          : customTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ArtworkCopyWith<$Res> implements $ArtworkCopyWith<$Res> {
  factory _$$_ArtworkCopyWith(
          _$_Artwork value, $Res Function(_$_Artwork) then) =
      __$$_ArtworkCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? url,
      String? title,
      String? description,
      String? price,
      String? customTitle,
      String? id});
}

/// @nodoc
class __$$_ArtworkCopyWithImpl<$Res> extends _$ArtworkCopyWithImpl<$Res>
    implements _$$_ArtworkCopyWith<$Res> {
  __$$_ArtworkCopyWithImpl(_$_Artwork _value, $Res Function(_$_Artwork) _then)
      : super(_value, (v) => _then(v as _$_Artwork));

  @override
  _$_Artwork get _value => super._value as _$_Artwork;

  @override
  $Res call({
    Object? url = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? customTitle = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Artwork(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      customTitle: customTitle == freezed
          ? _value.customTitle
          : customTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Artwork extends _Artwork with DiagnosticableTreeMixin {
  const _$_Artwork(
      {required this.url,
      required this.title,
      required this.description,
      required this.price,
      this.customTitle,
      this.id})
      : super._();

  @override
  final String? url;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? price;
  @override
  final String? customTitle;
  @override
  final String? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Artwork(url: $url, title: $title, description: $description, price: $price, customTitle: $customTitle, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Artwork'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('customTitle', customTitle))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artwork &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.customTitle, customTitle) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(customTitle),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_ArtworkCopyWith<_$_Artwork> get copyWith =>
      __$$_ArtworkCopyWithImpl<_$_Artwork>(this, _$identity);
}

abstract class _Artwork extends Artwork {
  const factory _Artwork(
      {required final String? url,
      required final String? title,
      required final String? description,
      required final String? price,
      final String? customTitle,
      final String? id}) = _$_Artwork;
  const _Artwork._() : super._();

  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get price => throw _privateConstructorUsedError;
  @override
  String? get customTitle => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ArtworkCopyWith<_$_Artwork> get copyWith =>
      throw _privateConstructorUsedError;
}
