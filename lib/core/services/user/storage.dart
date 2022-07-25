import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/request/request.dart';
import 'package:mhg/core/services/user/firestore.dart';
import 'package:mhg/utils/reusable_funtions.dart';

class UserStorageService {
  final log = getStackedLogger('UserStorageService');
  final ReusableFunc reusableFunction = ReusableFunc();
  final UserFsService _userFsService = UserFsService();

  Future pushUserRequest({
    required SignupRequest reqData,
  }) async {
    log.i('SignupRequest data has lastNorBizN: ${reqData.lastNorBizN}, \n '
        'IdCard: ${reqData.validIdCard} \n userId: ${reqData.uid}');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String title =
        reqData.lastNorBizN + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put your file inside
    // a folder that is the User's ID, that way you can set up your rules so
    // that you can only write and read from that folder if you are the owner.

    //Get a ref to the file we want to upload/download
    // 'validIdCardsTxt' serve as the storage folder name
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(validIdCardsTxt).child(title);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(reqData.validIdCard));
    // Listen for state changes, errors, and completion of the upload
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          log.i('file upload to cloud storage is in progress...');
          /*reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));*/
          break;
        case TaskState.success:
          log.i('file upload to cloud storage is successful');
          /*reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));*/
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveTitle = taskSnapshot.ref.name;
            reqData.validIdCard = downloadUrl;
            reqData.vIdStoragePath = retrieveTitle;
            _userFsService.pushAccCreationReq(reqData: reqData);
          } on FirebaseException catch (e) {
            log.i("Failed download from firebase storage with error '${e.code}'"
                " and\n message: ${e.message}");
          }
          break;
        case TaskState.error:
          reusableFunction.snackBar(
              message: 'Upload failed with an error',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
      }
    });
  }
}
