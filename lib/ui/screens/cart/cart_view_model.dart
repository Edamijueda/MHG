import 'package:mhg/app/app.router.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';

// BUSINESS LOGIC AND INTERACTION WITH THE SERVICES
// Once you change sth in dis viewModel you will be able to call notifyListener() which
// will rebuild that builder as u see in d reactive constructor(on the model's VIEW)
class CartViewModel extends MhgBaseViewModel {
  // Dis is where we will use the navigation service to navigate to our View. we get
  // our navService from our locator which is our Stacked Package wrapped version of
  // the Get_it package. Before we can even do dat we have to setUp our dependency
  // system in our app file (APP PACKAGE ). Which will be d last part of d app setUp

  //final navService = locator<NavigationService>();

  void goToNextScreen() {
    navService.navigateTo(Routes.signUpView);
  }
}
