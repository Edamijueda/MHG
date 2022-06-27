import 'package:mhg/app/app.locator.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
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
}
