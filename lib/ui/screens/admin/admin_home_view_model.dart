import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/setup/dialog/product/product_entry_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminHomeViewModel extends MhgBaseViewModel {
  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  //final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final DialogService _dialogService = locator<DialogService>();

  Future addImage({required String title}) async {
    DialogResponse? response = await _dialogService.showConfirmationDialog(
      title: 'Alert',
      description: dialogDescTxt,
      /*confirmationTitle: 'Ok',
      cancelTitle: 'Cancel',*/
    );
    print('response confirmation is: ${response?.confirmed}');
    if (response?.confirmed == true) {
      saveImageToStorage(_mhgBaseViewModel.selectedImage, title, bannerTxt);
      var result = _cloudStorageService.downloadResult;
      if (result != null) {
        print('Download urlName is: ${result[0]} with name: ${result[1]}');
        await _fireStoreDbService.addBanner(
          Banner(bannerUrl: result[0], bannerName: result[1]),
        );
      }
    }
  }

  Future saveImageToStorage(
      XFile? selectedImage, String title, String bannerTxt) async {
    await _cloudStorageService.uploadImage(
      imageToUpload: selectedImage,
      title: title,
      folderName: bannerTxt,
    );
  }

  callAddArtwork() async {
    var dataList = await ProductEntryViewModel.addArtwork();
    if (dataList != null) {
      //[0] selectedImage, [1] title
      saveImageToStorage(dataList[0], dataList[1], artworkTxt);
      var result = _cloudStorageService.downloadResult;
      if (result != null) {
        print('Download urlName is: ${result[0]} with name: ${result[1]}');
        await _fireStoreDbService.addArtwork(
          Artwork(
            artworkUrl: result[0],
            title: result[1],
            description: dataList[2],
            price: dataList[3],
          ),
        );
      }
    }
  }

/*String? uploadStatusMsg() {
    //notifyListeners();
    if(_cloudStorageService.uploadProgressMsg != null) {
      return _cloudStorageService.uploadProgressMsg;
    } else if(_cloudStorageService.uploadSuccessMsg != null) {
      return _cloudStorageService.uploadSuccessMsg;
    } else {
      return _cloudStorageService.uploadErrorMsg;
    }
  }*/
/*Future<String> download() async {
    _cloudStorageResult = await _cloudStorageService.downloadImage();
    notifyListeners();
    return downloadResult!.imageUrl;

  }*/

}
