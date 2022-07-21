import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// BUSINESS LOGIC AND INTERACTION WITH THE SERVICES
// Once you change sth in dis viewModel you will be able to call notifyListener() which
// will rebuild that builder as u see in d reactive constructor(on the model's VIEW)
class RetailUserViewModel extends BaseViewModel {
  //final log = getStackedLogger('RetailViewModel');
  final _navService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  String _selectedSubCat = '';
  String get selectedSubCat => _selectedSubCat;

  void setSelectedSubCat(String input) {
    _selectedSubCat = input;
    notifyListeners();
  }

  void goToCartScreen() {
    _navService.navigateTo(Routes.cartView);
  }

  void goToUserAccessScreen() {
    _navService.navigateTo(Routes.userAccessView);
  }

  void goToOrderHistoryScreen() {
    _navService.navigateTo(Routes.orderHistoryView);
  }

  void goToSavedItemScreen() {
    _navService.navigateTo(Routes.savedItemsView);
  }

  void goToAccountSettingsScreen() {
    _navService.navigateTo(Routes.accountSettingsView);
  }

  void goToHelpScreen() {
    _navService.navigateTo(Routes.helpView);
  }
}
