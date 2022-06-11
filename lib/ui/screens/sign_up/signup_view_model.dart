import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();

  final String _title = 'UserAccess';
  String get title => _title;

  void goToNextScreen() {
    _navService.navigateTo(Routes.signUpView);
  }
}
