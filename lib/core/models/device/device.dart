import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhg/constants.dart';

part 'device.freezed.dart';

@freezed
class Device with _$Device {
  const Device._();
  const factory Device({
    required final String url,
    required final String title,
    required final String description,
    required final String price,
    final String? customTitle,
    final String? deviceType,
    final String? id,
  }) = _Device;

  Map<String, dynamic> toMap() {
    return {
      deviceUrlTxt: url,
      titleTxt: title,
      descTxt: description,
      priceTxt: price,
      customTitleTxt: customTitle,
      deviceTypeTxt: deviceType,
    };
  }

  factory Device.fromDocument(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return Device(
      url: snapshot.get(deviceUrlTxt),
      title: snapshot.get(titleTxt),
      description: snapshot.get(descTxt),
      price: snapshot.get(priceTxt),
      customTitle: snapshot.get(customTitleTxt),
      deviceType: snapshot.get(deviceTypeTxt),
      id: snapshot.id, //reference.id, // Both return desired id
    );
  }
}
