import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mhg/constants.dart';

part 'artwork.freezed.dart';

@freezed
class Artwork with _$Artwork {
  const Artwork._();
  const factory Artwork({
    required final String artworkUrl,
    required final String title,
    required final String description,
    required final String price,
}) = _Artwork;

  Map<String, dynamic> toMap() {
    return {
      artworkUrlTxt: artworkUrl,
      titleTxt: title,
      descTxt: description,
      priceTxt: price,
    };
  }
  factory Artwork.fromDocument(DocumentSnapshot data) {
    return Artwork(
      //id: data.id,
      artworkUrl: data.get(artworkUrlTxt),
      title: data.get(titleTxt),
      description: data.get(descTxt),
      price: data.get(priceTxt),
    );
  }
}
