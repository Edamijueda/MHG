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

  Banner? get reactiveBannerData {
    //_selectedImage = null;
    return _cloudStorageService.reactiveBannerDataFromStorage;
  }

  Artwork? _artworkDataFromStorage;
  Artwork? get artworkDataFromStorage => _artworkDataFromStorage;
  Artwork? get tempArtworkDataFromStorage {
    return _cloudStorageService.artworkDataFromFirestore;
  }

  List<Artwork?>? get reactiveListOfArtwork =>
      _cloudStorageService.reactiveListOfArtwork;
  Artwork? get reactiveArtworkData => _cloudStorageService.reactiveArtworkData;

  String get fetchedNumber => dataMap![_numberDelayFuture];

  String get fetchedString => dataMap![_stringDelayFuture];

  //String get fetchedStringAddArtworkToFS => dataMap![_addArtworkToFirestoreKey];

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
      //_bannerDataFromFirestore = null;
      notifyListeners();
    } catch (e) {
      reusableFunction.snackBar(
          message: 'File selection fail: ${e.toString()}');
    }
  }

  Future addImage({required String title}) async {
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: dialogDescTxt,
      buttonTitle: 'Yes',
      buttonTitleColor: black,
      cancelTitle: 'Cancel',
    );
    log.i('response confirmation is: ${response?.confirmed}');
    if (response?.confirmed == true) {
      if (_selectedImage == null) {
        reusableFunction.snackBar(message: 'No banner image selected');
      } else {
        //_fireStoreDbService.tryingAnApproach = null;
        _bannerDataFromStorage = await _cloudStorageService.uploadBanner(
          imageToUpload: _selectedImage,
          title: title,
          folderName: bannerTxt,
        );
        if (reactiveBannerData == null) {
          // _bannerDataFromFirestore;
          _selectedImage = null;
          //notifyListeners();
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

  Future callAddArtwork() async {
    log.i('| no parameter');
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.productEntry,
      hasImage: true,
      takesInput: true,
    );
    if (response?.data != null) {
      _artworkDataFromStorage = await _cloudStorageService.uploadArtwork(
        imageToUpload: response?.data[0],
        title: response?.data[1],
        folderName: artworkTxt,
        artworkData: response?.data,
      );
      //notifySourceChanged();
      /*if (_artworkDataFromStorage == null &&
          _cloudStorageService.reactiveArtworkData != null) {
        listOfArtwork.add(_cloudStorageService.reactiveArtworkData);
        log.i(
            '_artworkDataFromStorage has title : ${_artworkDataFromStorage?.title}');
        //notifyListeners();
      }
      if (_artworkDataFromStorage != null) {
        listOfArtwork.add(_artworkDataFromStorage);
        log.i(
            '_artworkDataFromStorage has title : ${_artworkDataFromStorage?.title}');
        _cloudStorageService.reactiveListOfArtwork;
        // _bannerDataFromFirestore;
        //_selectedImage = null;
        //notifyListeners();
      }*/
    }
  }

  int length = 0;

  int addReactive(Artwork? reactiveArtworkData) {
    listOfArtwork.add(reactiveArtworkData);
    length = listOfArtwork.length;
    log.i('after adding reactiveData listOfArtwork.length is : $length');
    //notifyListeners();
    return length;
  }

  Future<String> getErrorMessage() async {
    await Future.delayed(const Duration(seconds: 6));
    throw Exception('This broke dude!');
  }

  callRealTimeOperations() {
    callBannerRealtimeUpdate();
  }

  callBannerRealtimeUpdate() {
    //setBusyForObject(_callBannerRealtimeUpdateKey, true);
    _cloudStorageService.getBannerRealtimeUpdate(docId: firstTierTxt);
    if (reactiveBannerData == null) {
      // _bannerDataFromFirestore;
      _selectedImage = null;
      //notifyListeners();
    }
    if (reactiveBannerData != null) {
      // _bannerDataFromFirestore;
      _selectedImage = null;
      //notifyListeners();
    }
    log.i(
        'bannerDataFromFirestore get the return title : ${_fireStoreDbService.tryingAnApproach?.bannerName}');
  }
}
