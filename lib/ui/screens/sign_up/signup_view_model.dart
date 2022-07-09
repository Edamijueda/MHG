import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/app/app.router.dart';
import 'package:mhg/core/services/authentication/authentication.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final log = getStackedLogger('SignUpViewModel');
  final _navService = locator<NavigationService>();
  final ReusableFunction reusableFunction = ReusableFunction();
  final DialogService _dialogService = locator<DialogService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  final String signupReqTxt =
      'You will get an approval mail from admin soon. After review';
  XFile? _selectedImage;
  XFile? get selectedImage => _selectedImage;

  void goToNextScreen() {
    _navService.navigateTo(Routes.signUpView);
  }

  Future signupRequest(List<String> userData) async {
    log.i('param userType is: ${userData[6]}');
    await _dialogService.showDialog(
      title: 'Request Status',
      description: signupReqTxt,
      buttonTitleColor: black,
    );
  }

  Future uploadID() async {
    log.i('no param');
    try {
      var tempImage = await _imageSelector.selectImage();
      _selectedImage = tempImage;
      log.i('_selectedImage is: ${_selectedImage?.path}');
      notifyListeners();
    } catch (e) {
      reusableFunction.snackBar(
          message: 'File selection fail: ${e.toString()}',
          duration: const Duration(seconds: 1));
    }
  }

  void showSnackBar() {
    reusableFunction.snackBar(
        message: 'no image selected: click \'Upload\'',
        duration: const Duration(seconds: 2));
  }

  Future<bool> checkIfEmailExist(String value) async {
    return await _authService.checkIfEmailExist(value);
  }
}
