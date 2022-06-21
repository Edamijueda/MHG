import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhg/constants.dart';

part 'artwork.freezed.dart';

@freezed
class Artwork with _$Artwork {
  const Artwork._();
  const factory Artwork({
    required final String? artworkUrl,
    required final String? title,
    required final String? description,
    required final String? price,
    final String? id,
  }) = _Artwork;

  Map<String, dynamic> toMap() {
    return {
      artworkUrlTxt: artworkUrl,
      titleTxt: title,
      descTxt: description,
      priceTxt: price,
    };
  }

  factory Artwork.fromDocument(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return Artwork(
      //id: data.id,
      artworkUrl: snapshot.get(artworkUrlTxt),
      title: snapshot.get(titleTxt),
      description: snapshot.get(descTxt),
      price: snapshot.get(priceTxt),
    );
  }
}
