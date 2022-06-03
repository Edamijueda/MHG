import 'package:mhg/app/app.router.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';

class SignUpViewModel extends MhgBaseViewModel {
  //final _navService = locator<NavigationService>();

  final String _title = 'UserAccess';
  String get title => _title;
  //final navService = locator<NavigationService>();

  void goToNextScreen() {
    navService.navigateTo(Routes.signUpView);
  }
}
