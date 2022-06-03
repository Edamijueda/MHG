import 'package:flutter/material.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/core/enums/dialog_type.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductEntryViewModel extends MhgBaseViewModel {

  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  final ReusableFunction _reusableFunction = ReusableFunction();
  //final ImageSelector _imageSelector = locator<ImageSelector>();
  //final CloudStorageService _cloudStorageService =
  //locator<CloudStorageService>();
  //final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  static final DialogService _dialogService = locator<DialogService>();
  //static late final List<DialogResponse> responseData;
  //XFile? _selectedImage;

  //XFile? get selectedImage => _selectedImage;
  //Banner? _cloudStorageResult;

  //Banner? get downloaded => _cloudStorageResult;

  /*Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    _selectedImage = tempImage;
    notifyListeners();
  }*/

  static Future<List?> addArtwork() async {
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.productEntry,
      hasImage: true,
      takesInput: true,
    );
    if(response?.data != null) {
      //responseData = response?.data;
      return response?.data;
      print('response for index 0 is: ${response?.data[0]}');
      print('response for index 1 is: ${response?.data[1]}');
      print('response for index 2 is: ${response?.data[2]}');
      print('response for index 3 is: ${response?.data[3]}');
    }
    return null;
    //print('receive response is: ${response?.confirmed}');
    /*print('response for index 0 is: ${response?.data[0]}');
    print('response for index 1 is: ${response?.data[1]}');
    print('response for index 2 is: ${response?.data[2]}');*/

  }

  void showSnackBar() {
    _reusableFunction.snackBar(message: 'No image selected');
  }
}