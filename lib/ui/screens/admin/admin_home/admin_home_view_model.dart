import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/enums/dialog_type.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminHomeViewModel extends MhgBaseViewModel {
  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  final ReusableFunction _reusableFunction = ReusableFunction();

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
      // saveImageToStorage(_mhgBaseViewModel.selectedImage, title, bannerTxt);
      saveImageToStorage(
        selectedImage: _mhgBaseViewModel.selectedImage,
        title: title,
        bannerTxt: bannerTxt,
      );
      var result = _cloudStorageService.bannerDataFromFirestore;
      if (result != null) {
        print(
            'Download urlName is: ${result.bannerUrl} with name: ${result.bannerName}');
        await _fireStoreDbService.addBanner(
          Banner(bannerUrl: result.bannerUrl, bannerName: result.bannerName),
        );
      }
    }
  }

  Future saveImageToStorage(
      {required XFile? selectedImage,
      required String title,
      required String bannerTxt}) async {
    await _cloudStorageService.uploadBanner(
      imageToUpload: selectedImage,
      title: title,
      folderName: bannerTxt,
    );
  }

  Future callAddArtwork() async {
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.productEntry,
      hasImage: true,
      takesInput: true,
    );
    if (response?.data != null) {
      //responseData = response?.data;
      //saveImageToStorage(dataList[0], dataList[1], artworkTxt);
      saveImageToStorage(
          selectedImage: response?.data[0],
          title: response?.data[1],
          bannerTxt: artworkTxt);
      var result = _cloudStorageService.bannerDataFromFirestore;
      if (result != null) {
        print(
            'Download urlName is: ${result.bannerUrl} with name: ${result.bannerName}');
        await _fireStoreDbService.addArtwork(
          Artwork(
            artworkUrl: result.bannerUrl,
            title: result.bannerName,
            description: response?.data[2],
            price: response?.data[3],
          ),
        );
      }
    }

    // var dataList = await ProductEntryViewModel.addArtwork();
    // if (dataList != null) {
    //   //[0] selectedImage, [1] title
    //   saveImageToStorage(dataList[0], dataList[1], artworkTxt);
    //   var result = _cloudStorageService.downloadResult;
    //   if (result != null) {
    //     print('Download urlName is: ${result[0]} with name: ${result[1]}');
    //     await _fireStoreDbService.addArtwork(
    //       Artwork(
    //         artworkUrl: result[0],
    //         title: result[1],
    //         description: dataList[2],
    //         price: dataList[3],
    //       ),
    //     );
    //   }
    // }
  }
}
