import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhg/constants.dart';

part 'profile.freezed.dart';

@unfreezed
class UserProfile with _$UserProfile {
  const UserProfile._();
  factory UserProfile({
    required final String userType,
    required final String uid,
    required final String firstNorBizOwnerN,
    required final String lastNorBizN,
    required final String email,
    required final String password,
    String? profilePic,
    String? phoneNo,
    List<String>? cartItems,
  }) = _UserProfile;

  Map<String, dynamic> toMap() {
    return {
      userTypeTxt: userType,
      uidTxt: uid,
      firstNorBizOwnerNTxt: firstNorBizOwnerN,
      lastNorBizNTxt: lastNorBizN,
      emailTxt: email,
      passwordTxt: password,
      profilePicTxt: profilePic,
      phoneNoTxt: phoneNo,
      cartItemsTxt: cartItems,
    };
  }

  factory UserProfile.fromDocument(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return UserProfile(
      userType: snapshot.get(userTypeTxt),
      uid: snapshot.get(uidTxt),
      firstNorBizOwnerN: snapshot.get(firstNorBizOwnerNTxt),
      lastNorBizN: snapshot.get(lastNorBizNTxt),
      email: snapshot.get(emailTxt),
      password: snapshot.get(passwordTxt),
      profilePic: snapshot.get(profilePicTxt),
      phoneNo: snapshot.get(phoneNoTxt),
      cartItems: snapshot.get(cartItemsTxt),
    );
  }
}
