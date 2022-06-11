import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';
import 'package:mhg/constants.dart';
part 'banner.freezed.dart';

@freezed
class Banner with _$Banner {
  const Banner._();
  const factory Banner({
    required final String bannerUrl,
    required final String bannerName,
  }) = _Banner;

  Map<String, Object> toMap() {
    return {
      bannerUrlTxt: bannerUrl,
      bannerNameTxt: bannerName,
    };
  }

  factory Banner.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    return Banner(
      //id: data.id,
      bannerUrl: snapshot.get(bannerUrlTxt),
      bannerName: snapshot.get(bannerNameTxt),
    );
  }

}
