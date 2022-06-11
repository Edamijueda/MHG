import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/constants.dart';
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
const String _errorDelayFuture = 'delayedError';
const String _selectImageKey = 'selectImageKey';

class Admin1stTierViewModel extends MultipleFutureViewModel {
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final ReusableFunction reusableFunction = ReusableFunction();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final DialogService _dialogService = locator<DialogService>();
  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;

  Banner? _bannerDataFromFirestore;
  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  int get fetchedNumber => dataMap![_numberDelayFuture];

  String get fetchedString => dataMap![_stringDelayFuture];

  dynamic get fetchedError =>
      error(_errorDelayFuture); //dataMap![_errorDelayFuture];

  bool get fetchingNumber => busy(_numberDelayFuture);

  bool get fetchingString => busy(_stringDelayFuture);

  bool get fetchingError => busy(_errorDelayFuture);

  //bool get trial => set

  @override
  Map<String, Future Function()> get futuresMap => {
        _numberDelayFuture: getNumberAfterDelay,
        _stringDelayFuture: getStringAfterDelay,
        _errorDelayFuture: getErrorMessage,
      };

  Future selectImage() async {
    try {
      var tempImage = await _imageSelector.selectImage();
      _selectedImage = tempImage;
      _bannerDataFromFirestore = null;
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
    print('response confirmation is: ${response?.confirmed}');
    if (response?.confirmed == true) {
      saveImageToStorage(
        selectedImage: _selectedImage,
        title: title,
        bannerTxt: bannerTxt,
      );
      var result = _cloudStorageService.downloadResult;
      if (result != null) {
        print('Download urlName is: ${result[0]} with name: ${result[1]}');
        _bannerDataFromFirestore = await _fireStoreDbService.addBanner(
          Banner(bannerUrl: result[0], bannerName: result[1]),
        );
        notifyListeners();
      }
      //addBannerToFireStore();
    }
  }



  Future addBannerToFireStore() async {
    var result = _cloudStorageService.downloadResult;
    if (result != null) {
      print('Download urlName is: ${result[0]} with name: ${result[1]}');
      _bannerDataFromFirestore = await _fireStoreDbService.addBanner(
        Banner(bannerUrl: result[0], bannerName: result[1]),
      );
      notifyListeners();
    }
    /*if (_bannerDataFromFirestore != null) {

    }*/
  }

  Future saveImageToStorage(
      {required XFile? selectedImage,
      required String title,
      required String bannerTxt}) async {
    await _cloudStorageService.uploadImage(
      imageToUpload: selectedImage,
      title: title,
      folderName: bannerTxt,
    );
  }

  Future<int> getNumberAfterDelay() async {
    await Future.delayed(Duration(seconds: 2));
    return 3;
  }

  Future<String> getStringAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    return 'String data';
  }

  Future<String> getErrorMessage() async {
    await Future.delayed(const Duration(seconds: 6));
    throw Exception('This broke dude!');
  }
}
