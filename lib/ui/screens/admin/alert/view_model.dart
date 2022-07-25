import 'package:firebase_auth/firebase_auth.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/login/login.dart';
import 'package:mhg/core/models/request/request.dart';
import 'package:mhg/core/services/authentication/authentication.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlertViewModel extends ReactiveViewModel {
  final log = getStackedLogger('AlertViewModel');
  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final String approveReqTxt = 'create an account and profile for this user';
  final String rejectReqTxt =
      'request will be deleted. No account will be created';

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_fireStoreDbService];

  // ReactiveService value getters
  List<SignupRequest>? get rSignupReq => _fireStoreDbService.rSignupReq;

  Future logout() async {
    log.i('no parameter');
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: logoutDialogTxt,
      buttonTitleColor: black,
      buttonTitle: 'Yes',
      cancelTitle: 'No',
      barrierDismissible: true,
    );
    if (response?.confirmed == true) {
      await FirebaseAuth.instance.signOut();
      _mhgBaseViewModel.goToUserAccessScreen();
    }
  }

  Future approveRequest(SignupRequest request) async {
    log.i('param SignupRequest, has last/bizName: ${request.lastNorBizN} \n '
        'email: ${request.email} \n uid: ${request.uid} \n userType: '
        '${request.userType} \n password: ${request.password}');
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: approveReqTxt,
      buttonTitle: 'Yes',
      buttonTitleColor: black,
      barrierDismissible: true,
    );
    if (response?.confirmed == true) {
      _fireStoreDbService.updateRequest(
        approvedReq: SignupRequest(
            firstNorBizOwnerN: request.firstNorBizOwnerN,
            lastNorBizN: request.lastNorBizN,
            email: request.email,
            password: request.password,
            dobOrBizLicenseNo: request.dobOrBizLicenseNo,
            validIdCard: request.validIdCard,
            userType: request.userType,
            uid: request.uid,
            vIdStoragePath: request.vIdStoragePath),
      );
    }
  }

  Future rejectRequest(SignupRequest request, Login adminOrDevLogin) async {
    log.i('param SignupRequest, has last/bizName: ${request.lastNorBizN} \n '
        'email: ${request.email} \n uid: ${request.uid} \n userType: '
        '${request.userType} \n password: ${request.password}');
    log.i(
        'login has mail: ${adminOrDevLogin.mail} \n pass: ${adminOrDevLogin.pass}');

    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: rejectReqTxt,
      buttonTitleColor: black,
      barrierDismissible: true,
    );
    if (response?.confirmed == true) {
      await FirebaseAuth.instance.signOut().then((value) async {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: request.email,
          password: request.password,
        )
            .then((value) async {
          await value.user
              ?.delete(); //FirebaseAuth.instance.currentUser?.delete();
        }).then((value) async {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
            email: adminOrDevLogin.mail,
            password: adminOrDevLogin.pass,
          )
              .then((value) {
            _fireStoreDbService.removeFromSignupReq(
              SignupRequest(
                  firstNorBizOwnerN: request.firstNorBizOwnerN,
                  lastNorBizN: request.lastNorBizN,
                  email: request.email,
                  password: request.password,
                  dobOrBizLicenseNo: request.dobOrBizLicenseNo,
                  validIdCard: request.validIdCard,
                  userType: request.userType,
                  uid: request.uid,
                  vIdStoragePath: request.vIdStoragePath),
            );
          });
        });
      });
    }
  }

  realtimeOperations() {
    signupReqRtUpdate(); // Req mean Request, Rt mean Realtime
  }

  void signupReqRtUpdate() {
    _fireStoreDbService.signupReqRtUpdate();
  }
}
