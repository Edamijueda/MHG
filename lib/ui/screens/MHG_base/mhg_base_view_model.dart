import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.router.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MhgBaseViewModel extends IndexTrackingViewModel {
  final navService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  //final CloudStorageService _cloudStorageService =
  //locator<CloudStorageService>();
  //final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final DialogService _dialogService = locator<DialogService>();
  XFile? _selectedImage;
  XFile? get selectedImage => _selectedImage;
  //Banner? _cloudStorageResult;

  //Banner? get downloaded => _cloudStorageResult;

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    _selectedImage = tempImage;
    notifyListeners();
  }

  void validateScreenToNavTo({required String? eBText}) {
    if (eBText == signIn) {
      navService.navigateTo(Routes.customerView);
    } else if (eBText == signUpHere) {
      navService.navigateTo(Routes.signUpView);
    } else if (eBText == signUpAsCustomer) {
      navService.navigateTo(Routes.customerView);
    } else if (eBText == signUpAsRetailer) {
      navService.navigateTo(Routes.retailUserView);
    } else if (eBText == signInHere) {
      navService.navigateTo(Routes.userAccessView);
    } else {
      //navService.navigateTo(Routes.retailerHomeView);
      print('The button you click doesn\'t know d screen to navigateTo');
    }
  }

  void goToUserAccessScreen() {
    navService.navigateTo(Routes.userAccessView);
  }

  void goToOrderHistoryScreen() {
    navService.navigateTo(Routes.orderHistoryView);
  }

  void goToSavedItemScreen() {
    navService.navigateTo(Routes.savedItemsView);
  }

  void goToAccountSettingsScreen() {
    navService.navigateTo(Routes.accountSettingsView);
  }

  void goToHelpScreen() {
    navService.navigateTo(Routes.helpView);
  }

  void goToCartScreen() {
    navService.navigateTo(Routes.cartView);
  }
}
