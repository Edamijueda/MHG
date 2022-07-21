import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhg/constants.dart';

part 'request.freezed.dart';

@unfreezed
class SignupRequest with _$SignupRequest {
  const SignupRequest._();

  factory SignupRequest({
    required final String firstNorBizOwnerN,
    required final String lastNorBizN,
    required final String email,
    required final String password,
    required final String dobOrBizLicenseNo,
    required String validIdCard,
    required final String userType,
    required final String uid,
    String? vIdStoragePath,
    //String? url,
    final String? id,
  }) = _SignupRequest;

  Map<String, dynamic> toMap() {
    return {
      firstNorBizOwnerNTxt: firstNorBizOwnerN,
      lastNorBizNTxt: lastNorBizN,
      emailTxt: email,
      passwordTxt: password,
      dobOrBizLicenseNoTxt: dobOrBizLicenseNo,
      validIdCardTxt: validIdCard,
      userTypeTxt: userType,
      uidTxt: uid,
      vIdStoragePathTxt: vIdStoragePath,
    };
  }

  factory SignupRequest.fromDocument(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return SignupRequest(
      firstNorBizOwnerN: snapshot.get(firstNorBizOwnerNTxt),
      lastNorBizN: snapshot.get(lastNorBizNTxt),
      email: snapshot.get(emailTxt),
      password: snapshot.get(passwordTxt),
      dobOrBizLicenseNo: snapshot.get(dobOrBizLicenseNoTxt),
      validIdCard: snapshot.get(validIdCardTxt),
      userType: snapshot.get(userTypeTxt),
      uid: snapshot.get(uidTxt),
      vIdStoragePath: snapshot.get(vIdStoragePathTxt),
      //id: snapshot.id, //reference.id, // Both return desired id
    );
  }
}
