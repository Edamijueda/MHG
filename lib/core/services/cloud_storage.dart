// This class wraps the firebase storage package so that we don't have dependencies
// outside of this class on that package
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';

import 'database/firestore.dart';

class CloudStorageService with ReactiveServiceMixin {
  CloudStorageService() {
    listenToReactiveValues(
      [_reactiveBannerDataFromStorage, _reactiveArtworkDataFromStorage],
    );
  }

  final log = getStackedLogger('CloudStorageService');
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();

  //final Admin1stTierViewModel _admin1stTierViewModel = Admin1stTierViewModel();

  late final ReactiveValue<Banner?> _reactiveBannerDataFromStorage =
      ReactiveValue<Banner?>(null);

  Banner? get reactiveBannerDataFromStorage =>
      _reactiveBannerDataFromStorage.value;

  late final ReactiveValue<Artwork?> _reactiveArtworkDataFromStorage =
      ReactiveValue<Artwork?>(null);

  Artwork? get reactiveArtworkData => _reactiveArtworkDataFromStorage.value;

  //set tryingAnApproach(Banner? banner) => _tryingAnApproach.value = banner;

  final ReusableFunction reusableFunction = ReusableFunction();

  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;
  Artwork? _artworkDataFromFirestore;

  Artwork? get artworkDataFromFirestore => _artworkDataFromFirestore;

  Future<dynamic> uploadImage({
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    List<String>? artworkData,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    if (folderName == artworkTxt) {
      title = title + DateTime.now().millisecondsSinceEpoch.toString();
    }
    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(title);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    dynamic temp;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(message: 'file upload is in progress...');
          break;
        case TaskState.success:
          reusableFunction.snackBar(message: 'file upload is successful');
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var getDownloadTitle = taskSnapshot.ref.name;
            if (folderName == artworkTxt && artworkData != null) {
              _artworkDataFromFirestore = await _fireStoreDbService.addArtwork(
                  Artwork(
                      artworkUrl: downloadUrl,
                      title: getDownloadTitle,
                      description: artworkData[2],
                      price: artworkData[3]));
              temp = _artworkDataFromFirestore;
              _reactiveArtworkDataFromStorage.value = _artworkDataFromFirestore;
            } else {
              _bannerDataFromFirestore = await _fireStoreDbService.addBanner(
                  Banner(bannerUrl: downloadUrl, bannerName: getDownloadTitle));
              //_admin1stTierViewModel.setSelectImage(null);
              temp = _bannerDataFromFirestore;
              _reactiveBannerDataFromStorage.value = _bannerDataFromFirestore;

              log.i(
                  '_tryingAnApproach.value imageURL: ${reactiveBannerDataFromStorage?.bannerUrl} and \n'
                  'title: ${reactiveBannerDataFromStorage?.bannerName}');
            }
          } on FirebaseException catch (e) {
            print("Failed download from firebase storage with error '${e.code}'"
                " and\n message: ${e.message}");
          }
          break;
        case TaskState.error:
          reusableFunction.snackBar(message: 'Upload failed with an error');
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
      }
    });
    log.i('temp _downloadResult imageURL: ${temp?.bannerUrl} and \n'
        'title: ${temp?.bannerName}');
    return temp;
  }

  getBannerRealtimeUpdate({required String docId}) {
    log.i('parameter: $docId');
    FirebaseFirestore.instance
        .collection(bannerTxt)
        .doc(docId)
        .snapshots()
        .listen(
      (event) async {
        var docRef = event.reference.withConverter(
            fromFirestore: Banner.fromDocument,
            toFirestore: (Banner banner, _) => banner.toMap());
        final docSnap = await docRef.get();
        _reactiveBannerDataFromStorage.value = docSnap.data();

        log.i(
          'banner return: ${_reactiveBannerDataFromStorage.value?.bannerName} \n '
          'and image url: ${_reactiveBannerDataFromStorage.value?.bannerUrl}',
        );
      },
      onError: (error) => log.i('BannerRealtimeUpdate Listener failed: $error'),
    );
    log.i(
      'banner return outside listen method: ${_reactiveBannerDataFromStorage.value?.bannerName} \n '
      'and image url: ${_reactiveBannerDataFromStorage.value?.bannerUrl}',
    );
  }
}
