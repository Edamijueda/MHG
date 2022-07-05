import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RetailViewModel extends BaseViewModel {
  final log = getStackedLogger('RetailViewModel');
  final DialogService _dialogService = locator<DialogService>();
  String _selectedSubCat = '';
  String get selectedSubCat => _selectedSubCat;

  String getTextFromSelectedTab(int selectedIndex) {
    if (selectedIndex == 0) {
      //_selectedSubCat = designFlowerTxt;
      //setSelectedSubCat(designFlowerTxt);
      return flowerTxt;
    }
    if (selectedIndex == 1) {
      //_selectedSubCat = cbdCartTxt;
      //setSelectedSubCat(cbdCartTxt);
      return cartTxt;
    }
    if (selectedIndex == 2) {
      //_selectedSubCat = candyTxt;
      //setSelectedSubCat(candyTxt);
      return edibleTxt;
    }
    if (selectedIndex == 3) {
      //_selectedSubCat = shatterTxt;
      //setSelectedSubCat(shatterTxt);
      return extractTxt;
    }
    if (selectedIndex == 4) {
      //_selectedSubCat = artPrintAndDigitalTxt;
      //setSelectedSubCat(artPrintAndDigitalTxt);
      return gearTxt;
    }
    return flowerTxt;
  }

  void setSelectedSubCat(String input) {
    _selectedSubCat = input;
    notifyListeners();
  }

  Future addDevice(int selectedIndex) async {
    log.i('param selectedIndex $selectedIndex');
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.chooseFlowerType,
      hasImage: true,
      takesInput: true,
    );
    /*if (response?.data != null) {
      await _cloudStorageService.uploadPipe(
        collectionPath: pipeDbPathTxt,
        imageToUpload: response?.data[0],
        title: response?.data[1],
        folderName: deviceTxt,
        desc: response?.data[2],
        price: response?.data[3],
      );
    }*/
  }

  void realtimeOperations({required int index}) {
    _selectedSubCat = designFlowerTxt;
    //notifyListeners();
    //getTextFromSelectedTab(index);
  }
}
