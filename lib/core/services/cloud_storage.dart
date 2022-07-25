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
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';

import 'database/firestore.dart';

class CloudStorageService with ReactiveServiceMixin {
  CloudStorageService() {
    listenToReactiveValues(
      [
        _reactiveBannerDataFromStorage,
      ],
    );
  }

  final log = getStackedLogger('CloudStorageService');
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();

  //final Admin1stTierViewModel _admin1stTierViewModel = Admin1stTierViewModel();

  late final ReactiveValue<Banner?> _reactiveBannerDataFromStorage =
      ReactiveValue<Banner?>(null);

  Banner? get reactiveBannerDataFromStorage =>
      _reactiveBannerDataFromStorage.value;

  final ReusableFunc reusableFunction = ReusableFunc();

  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  Banner? retrievedBanner;

  Future<Banner?> uploadBanner({
    required XFile? imageToUpload,
    required String title,
    required String folderName,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage

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
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var getBannerName = taskSnapshot.ref.name;
            _bannerDataFromFirestore = await _fireStoreDbService.addBanner(
                Banner(bannerUrl: downloadUrl, bannerName: getBannerName));
            retrievedBanner = _bannerDataFromFirestore;
            _reactiveBannerDataFromStorage.value = _bannerDataFromFirestore;
          } on FirebaseException catch (e) {
            print("Failed download from firebase storage with error '${e.code}'"
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
    /*log.i('temp _downloadResult imageURL: ${temp?.bannerUrl} and \n'
        'title: ${temp?.bannerName}');*/
    log.i(
        'return temp _downloadResult imageURL: ${retrievedBanner?.bannerUrl} and \n'
        'title: ${retrievedBanner?.bannerName}');

    return retrievedBanner;
  }

  Future uploadArtwork({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addArtwork(
              artworkData: Artwork(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
          } on FirebaseException catch (e) {
            print("Failed download from firebase storage with error '${e.code}'"
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

  void removeArtworkFromStorage(Artwork artwork) {
    log.i('parameter, artwork with customTitle is: ${artwork.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(artworkTxt)
        .child(artwork.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////
  // DEVICE cloud storage functions
  //////////////////////////////////////////////////////////////////////////////

  Future uploadPipe({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            await _fireStoreDbService.addPipe(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removePipeFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////

  Future uploadGrinder({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addGrinder(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removeGrinderFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////

  Future uploadRoller({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addRoller(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removeRollerFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////

  Future uploadTaster({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addTaster(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removeTasterFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////

  Future uploadBong({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addBong(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removeBongFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////

  Future uploadDabRing({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addDabRing(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removeDabRingFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

  //////////////////////////////////////////////////////////////////////////////

  Future uploadBubble({
    required String collectionPath,
    required XFile? imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload?.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload!.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            log.i('retrieveCustomTitle: $retrieveCustomTitle');
            await _fireStoreDbService.addBubble(
              deviceData: Device(
                  url: downloadUrl,
                  title: title,
                  description: desc,
                  price: price,
                  customTitle: retrieveCustomTitle),
              path: collectionPath,
            );
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

  void removeBubbleFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(deviceTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

////////////////////////////////////////////////////////////////////////////////
// RETAIL DEVICE cloud storage functions
////////////////////////////////////////////////////////////////////////////////

  Future uploadFlower({
    required String collectionPath,
    required XFile imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
    required String selected,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            await _fireStoreDbService.addFlower(
              deviceData: Device(
                url: downloadUrl,
                title: title,
                description: desc,
                price: price,
                customTitle: retrieveCustomTitle,
                deviceType: selected,
              ),
              path: collectionPath,
            );
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

  void removeFlowerFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(retailDevicePathTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

//////////////////////////////////////////////////////////////////////////////

  Future uploadCartridge({
    required String collectionPath,
    required XFile imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
    required String selected,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            await _fireStoreDbService.addCartridge(
              deviceData: Device(
                url: downloadUrl,
                title: title,
                description: desc,
                price: price,
                customTitle: retrieveCustomTitle,
                deviceType: selected,
              ),
              path: collectionPath,
            );
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

  void removeCartridgeFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(retailDevicePathTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

//////////////////////////////////////////////////////////////////////////////

  Future uploadEdible({
    required String collectionPath,
    required XFile imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
    required String selected,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            await _fireStoreDbService.addEdible(
              deviceData: Device(
                url: downloadUrl,
                title: title,
                description: desc,
                price: price,
                customTitle: retrieveCustomTitle,
                deviceType: selected,
              ),
              path: collectionPath,
            );
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

  void removeEdibleFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(retailDevicePathTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

//////////////////////////////////////////////////////////////////////////////

  Future uploadExtract({
    required String collectionPath,
    required XFile imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
    required String selected,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            await _fireStoreDbService.addExtract(
              deviceData: Device(
                url: downloadUrl,
                title: title,
                description: desc,
                price: price,
                customTitle: retrieveCustomTitle,
                deviceType: selected,
              ),
              path: collectionPath,
            );
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

  void removeExtractFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(retailDevicePathTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

//////////////////////////////////////////////////////////////////////////////

  Future uploadGearMerch({
    required String collectionPath,
    required XFile imageToUpload,
    required String title,
    required String folderName,
    required String desc,
    required String price,
    required String selected,
  }) async {
    log.i('received 3 param, they are: \n imageToUpload: ${imageToUpload.path}'
        '\n title: $title and \n folderName: $folderName');
    // Let's create the name the file will take up on the cloud storage. The time,
    // allows dis to give us unique value even if title is the same for multiple
    // upload to our storage
    String customTitle =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // To be more specific, in a real world app, you would put this inside a folder
    // that is the User's ID, that way you can set up your rules so that you can
    // only write and read from that folder if you are the owner of that folder.

    //Get a ref to the file we want to upload/download
    var _fbStorageRef =
        FirebaseStorage.instance.ref().child(folderName).child(customTitle);
    // This will store the result of calling the putFile() function on the
    // firebase storage ref. This function takes in file from the dart.io package
    var _uploadTask = _fbStorageRef.putFile(File(imageToUpload.path));
    // Listen for state changes, errors, and completion of the upload
    //List<Artwork?>? temp1;
    _uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          reusableFunction.snackBar(
              message: 'file upload is in progress...',
              duration: const Duration(seconds: 1));
          break;
        case TaskState.success:
          reusableFunction.snackBar(
              message: 'file upload is successful',
              duration: const Duration(seconds: 1));
          try {
            var downloadUrl = await taskSnapshot.ref.getDownloadURL();
            var retrieveCustomTitle = taskSnapshot.ref.name;
            await _fireStoreDbService.addGearMerch(
              deviceData: Device(
                url: downloadUrl,
                title: title,
                description: desc,
                price: price,
                customTitle: retrieveCustomTitle,
                deviceType: selected,
              ),
              path: collectionPath,
            );
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

  void removeGearMerchFromStorage(Device device) {
    log.i('parameter, device with customTitle: ${device.customTitle}');
    var _fbStorageRef = FirebaseStorage.instance
        .ref()
        .child(retailDevicePathTxt)
        .child(device.customTitle!);
    _fbStorageRef.delete();
  }

//////////////////////////////////////////////////////////////////////////////
}
