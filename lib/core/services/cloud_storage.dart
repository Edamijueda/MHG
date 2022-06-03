// This class wraps the firebase storage package so that we don't have dependencies
// outside of this class on that package
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
//import 'package:mhg/core/models/banner.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked_services/stacked_services.dart';

class CloudStorageService {
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final ReusableFunction reusableFunction = ReusableFunction();

  //late final UploadTask _uploadTask;
  late String imageFileName;

  // Get a ref to the file we want to upload/download
  /*late final Reference _fbStorageRef =
      FirebaseStorage.instance.ref().child('banner').child(imageFileName);*/

  List<String>? _downloadResult;
  List<String>? get downloadResult => _downloadResult;


  Future uploadImage({
    required XFile? imageToUpload,
    required String title,
    required String folderName,
  }) async {
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // post
    //title = title; //+ DateTime.now().millisecondsSinceEpoch.toString();
    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(title);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(message: 'file upload is in progress...');
          break;
        case TaskState.success:
          reusableFunction.snackBar(message: 'file upload is successful');
          try {
            final String downloadUrl= await taskSnapshot.ref.getDownloadURL();
            _downloadResult = [downloadUrl, title];
            //_banner = Banner(bannerUrl: downloadUrl, bannerName: title);
          } on FirebaseException catch (e) {
            print("Failed download from firebase storage with error '${e.code}'"
                " and\n message: ${e.message}");
          }
          break;
        case TaskState.error:
          reusableFunction.snackBar(message: 'Upload failed with an error');
          break;
        //_uploadErrorMsg = 'Upload failed with an error';
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
