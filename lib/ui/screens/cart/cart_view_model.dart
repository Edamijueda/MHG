import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// BUSINESS LOGIC AND INTERACTION WITH THE SERVICES
// Once you change sth in dis viewModel you will be able to call notifyListener() which
// will rebuild that builder as u see in d reactive constructor(on the model's VIEW)
class CartViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  // Dis is where we will use the navigation service to navigate to our View. we get
  // our navService from our locator which is our Stacked Package wrapped version of
  // the Get_it package. Before we can even do dat we have to setUp our dependency
  // system in our app file (APP PACKAGE ). Which will be d last part of d app setUp

  void goToNextScreen() {
    _navService.navigateTo(Routes.signUpView);
  }
}
