import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.router.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// BUSINESS LOGIC AND INTERACTION WITH THE SERVICES
// Once you change sth in dis viewModel you will be able to call notifyListener() which
// will rebuild that builder as u see in d reactive constructor(on the model's VIEW)
abstract class CustomerViewModel extends ReactiveViewModel {
  final _navService = locator<NavigationService>();
  // Dis is where we will use the navigation service to navigate to our View. we get
  // our navService from our locator which is our Stacked Package wrapped version of
  // the Get_it package. Before we can even do dat we have to setUp our dependency
  // system in our app file (APP PACKAGE ). Which will be d last part of d app setUp

  final String _title = 'UserAccess';
  String get title => _title;
  //final navService = locator<NavigationService>();

  void goToNextScreen() {
    _navService.navigateTo(Routes.signUpView);
  }

  // Dis method will be implemented in the 3tiers classes
  Future viewDetails(Artwork artwork);
}
