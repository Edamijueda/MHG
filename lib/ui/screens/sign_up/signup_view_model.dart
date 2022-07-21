import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/app/app.router.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/request/request.dart';
import 'package:mhg/core/services/authentication/authentication.dart';
import 'package:mhg/core/services/user/storage.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final log = getStackedLogger('SignUpViewModel');
  final _navService = locator<NavigationService>();
  final UserStorageService _storageService = locator<UserStorageService>();
  final ReusableFunction reusableFunction = ReusableFunction();
  final DialogService _dialogService = locator<DialogService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final AuthenticationService _authService = locator<AuthenticationService>();

  //final AuthenticationService _authService = locator<AuthenticationService>();
  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;

  void goToNextScreen(String userType) {
    if (userType == customerTxt) {
      _navService.navigateTo(Routes.customerView);
    } else {
      _navService.navigateTo(Routes.retailUserView);
    }
  }

  Future requestAccCreation(List<String> userData) async {
    log.i(
        'param userData, has first/ownerName is: ${userData[0]} \n last/bizName'
        ' is: ${userData[1]} \n email is: ${userData[2]} \n password is: '
        '${userData[3]} \n Dob/BizLicenseNo is: ${userData[4]} \n validId is: '
        '${userData[5]} \n userType is: ${userData[6]}');
    User? user = await _authService.signUpWithEmail(
      email: userData[2],
      password: userData[3],
    );
    if (user != null) {
      reusableFunction.snackBar(
          message: 'wait few sec to see if your account request was successful',
          duration: const Duration(seconds: 4));

      _storageService.pushUserRequest(
        reqData: SignupRequest(
            firstNorBizOwnerN: userData[0],
            lastNorBizN: userData[1],
            email: userData[2],
            password: userData[3],
            dobOrBizLicenseNo: userData[4],
            validIdCard: userData[5],
            userType: userData[6],
            uid: user.uid),
      );
    }
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

  Future customerHelperBtnDialog() async {
    await _dialogService.showDialog(
      title: 'Customer:',
      description: 'This profile is for customers who do not have an '
          'EIN(BUSINESS) and for those who are recreational',
      buttonTitleColor: black,
      barrierDismissible: true,
    );
  }

  Future retailerHelperBtnDialog() async {
    await _dialogService.showDialog(
      title: 'Retailer:',
      description: 'This profile is for Businesses/Retailers who are able to'
          'provide a valid EIN/LLC as part of their application',
      buttonTitleColor: black,
      barrierDismissible: true,
    );
  }
}
