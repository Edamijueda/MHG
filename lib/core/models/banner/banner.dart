import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';
part 'banner.freezed.dart';

@freezed
class Banner with _$Banner {
  const Banner._();
  const factory Banner({
    required final String bannerUrl,
    required final String bannerName,
  }) = _Banner;

  Map<String, dynamic> toMap() {
    return {
      'bannerUrl': bannerUrl,
      'bannerName': bannerName,
    };
  }

//factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);



}

/*class Banner {
  final String imageUrl;
  final String imageFileName;

  Banner({required this.imageUrl, required this.imageFileName});
}*/

/*{
  final String bannerUrl = 'banner_url';
  final String bannerName = 'banner_name';
  return Banner(
    bannerUrl: snapshot.get(bannerUrl),
    bannerName: snapshot.get(bannerName),
  );
}*/
