import 'package:firebase_auth/firebase_auth.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminHomeViewModel extends MhgBaseViewModel {
  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  final ReusableFunction _reusableFunction = ReusableFunction();

  //final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final DialogService _dialogService = locator<DialogService>();

  Future logout() async {
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
}
