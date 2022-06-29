import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/enums/dialog_type.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _numberDelayFuture = 'delayedNumber';
const String _stringDelayFuture = 'delayedString';
const String _addArtworkToFirestoreKey = 'addArtworkToFirestoreKey';
const String _callBannerRealtimeUpdateKey = 'callBannerRealtimeUpdateKey';

class Admin1stTierViewModel extends MultipleFutureViewModel {
  final log = getStackedLogger('Admin1stTierViewModel');
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final ReusableFunction reusableFunction = ReusableFunction();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final DialogService _dialogService = locator<DialogService>();

  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;
  Banner? _bannerDataFromStorage;

  Banner? get bannerDataFromStorage => _bannerDataFromStorage;

  // get reactive values
  Banner? get reactiveBannerData {
    return _cloudStorageService.reactiveBannerDataFromStorage;
  }

  List<Artwork?>? get reactiveListOfArtwork =>
      _fireStoreDbService.firstTierReactiveListOfArtwork;

  List<Artwork?>? get secTierReactiveListOfArtwork =>
      _fireStoreDbService.secTierReactiveListOfArtwork;

  List<Artwork?>? get thirdTierReactiveListOfArtwork =>
      _fireStoreDbService.thirdTierReactiveListOfArtwork;

  // Multiple Futures attributes/functions
  String get fetchedNumber => dataMap![_numberDelayFuture];

  String get fetchedString => dataMap![_stringDelayFuture];

  dynamic get fetchedErrorAddArtworkToFS =>
      error(_addArtworkToFirestoreKey); //dataMap![_errorDelayFuture];

  bool get fetchingNumber => busy(_numberDelayFuture);

  bool get fetchingString => busy(_stringDelayFuture);

  bool get fetchingAddArtworkToFirestore => busy(_addArtworkToFirestoreKey);

  bool get fetchingCallBannerRealtimeUpdate =>
      busy(_callBannerRealtimeUpdateKey);

  @override
  // TODO: implement reactiveServices
  List<ReactiveServiceMixin> get reactiveServices =>
      [_fireStoreDbService, _cloudStorageService];

  @override
  Map<String, Future Function()> get futuresMap => {
        _numberDelayFuture: getNumberAfterDelay,
        _stringDelayFuture: getStringAfterDelay,
        //_addArtworkToFirestoreKey: addArtworkToFirestore(response),
      };

  Future selectImage() async {
    log.i('assign user selected image to selectedImage');
    try {
      var tempImage = await _imageSelector.selectImage();
      _selectedImage = tempImage;
      log.i('_selectedImage is: ${_selectedImage?.path}');
      notifyListeners();
    } catch (e) {
      reusableFunction.snackBar(
          message: 'File selection fail: ${e.toString()}',
          duration: const Duration(seconds: 1));
    }
  }

  Future addImage({required String title}) async {
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: dialogDescAddBannerTxt,
      buttonTitle: 'Yes',
      buttonTitleColor: black,
      cancelTitle: 'Cancel',
    );
    log.i('response confirmation is: ${response?.confirmed}');
    if (response?.confirmed == true) {
      if (_selectedImage == null) {
        reusableFunction.snackBar(
            message: 'No banner image selected',
            duration: const Duration(seconds: 1));
      } else {
        _bannerDataFromStorage = await _cloudStorageService.uploadBanner(
          imageToUpload: _selectedImage,
          title: title,
          folderName: bannerTxt,
        );
        if (reactiveBannerData == null) {
          _selectedImage = null;
        }
        if (reactiveBannerData != null) {
          // _bannerDataFromFirestore;
          _selectedImage = null;
          //notifyListeners();
        }
        log.i(
            '_bannerDataFromCloudStorage get BannerName: ${_bannerDataFromStorage?.bannerName}');
      }
    }
  }

  Future<int> getNumberAfterDelay() async {
    await Future.delayed(Duration(seconds: 2));
    return 3;
  }

  Future<String> getStringAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    return 'String data';
  }

  List<Artwork?> listOfArtwork = List<Artwork?>.empty(growable: true);

  Future callAddArtwork({required String artworkType}) async {
    log.i('param artworkType: $artworkType');
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.productEntry,
      hasImage: true,
      takesInput: true,
    );
    if (response?.data != null) {
      await _cloudStorageService.uploadArtwork(
        collectionPath: artworkType,
        imageToUpload: response?.data[0],
        title: response?.data[1],
        folderName: artworkTxt,
        desc: response?.data[2],
        price: response?.data[3],
      );
    }
  }

  Future<String> getErrorMessage() async {
    await Future.delayed(const Duration(seconds: 6));
    throw Exception('This broke dude!');
  }

  callRealTimeOperations({required String docId, required String path}) {
    callBannerRealtimeUpdate(id: docId);
    callArtworkRealtimeUpdate(collectionPath: path);
  }

  callBannerRealtimeUpdate({required String id}) {
    _cloudStorageService.getBannerRealtimeUpdate(docId: id);
    if (reactiveBannerData == null) {
      // _bannerDataFromFirestore;
      _selectedImage = null;
    }
    if (reactiveBannerData != null) {
      _selectedImage = null;
    }
    log.i(
        'bannerDataFromFirestore get the return title : ${_fireStoreDbService.tryingAnApproach?.bannerName}');
  }

  void callArtworkRealtimeUpdate({required String collectionPath}) {
    _fireStoreDbService.getArtworkRealtimeUpdate(path: collectionPath);
  }

  Future viewProductDetails(Artwork? artwork) async {
    log.i('parameter artwork with title: ${artwork?.title}');
    //DialogResponse? response =
    await _dialogService.showCustomDialog(
      variant: DialogType.productDetails,
      hasImage: true,
      barrierDismissible: true,
      imageUrl: artwork?.url,
      title: artwork?.title,
      description: artwork?.description,
      data: artwork,
    );
  }

  Future deleteArtwork({
    required Artwork? artwork,
    required String collectionPath,
  }) async {
    log.i(
        'parameters are; artworkData title: ${artwork?.title} and \n collectionPath: $collectionPath');
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: dialogDescDelProductTxt,
      buttonTitle: 'Yes',
      buttonTitleColor: black,
      cancelTitle: 'Cancel',
    );
    log.i('response confirmation is: ${response?.confirmed}');
    if (response?.confirmed == true) {
      // to delete the reference in fireStore
      try {
        _fireStoreDbService.removeArtworkFromFS(
          artwork: artwork!,
          path: collectionPath,
        );
      } catch (e) {
        reusableFunction.snackBar(
            message:
                'unable to delete artwork from fireStore, contact developer: ${e.toString()}',
            duration: const Duration(seconds: 1));
      }
      // to delete the reference in cloudStorage
      try {
        _cloudStorageService.removeArtworkFromStorage(artwork!);
      } catch (e) {
        reusableFunction.snackBar(
            message:
                'unable to delete artwork from cloudStorage, contact developer: ${e.toString()}',
            duration: const Duration(seconds: 1));
      }
    }
  }
}
