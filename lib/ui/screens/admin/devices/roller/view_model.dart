import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/enums/dialog_type.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RollerViewModel extends ReactiveViewModel {
  final log = getStackedLogger('RollerViewModel');
  final DialogService _dialogService = locator<DialogService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final ReusableFunction reusableFunction = ReusableFunction();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();

  // private setters and their public getters
  XFile? _selectedImage;
  XFile? get selectedImage => _selectedImage;

  // ReactiveService value getters
  List<Device>? get reactiveRoller => _fireStoreDbService.reactiveRoller;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_fireStoreDbService];

  Future addDevice() async {
    log.i('no param');
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.rollerEntry,
      hasImage: true,
      takesInput: true,
    );
    if (response?.data != null) {
      await _cloudStorageService.uploadRoller(
        collectionPath: rollerDbPathTxt,
        imageToUpload: response?.data[0],
        title: response?.data[1],
        folderName: deviceTxt,
        desc: response?.data[2],
        price: response?.data[3],
      );
    }
  }

  Future selectImage() async {
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

  Future viewDeviceDetails(Device device) async {
    log.i('parameter device with title: ${device.title}');
    await _dialogService.showCustomDialog(
      variant: DialogType.productDetails,
      hasImage: true,
      barrierDismissible: true,
      imageUrl: device.url,
      title: device.title,
      description: device.description,
      data: device,
    );
  }

  Future deleteDevice({
    required Device device,
  }) async {
    log.i('parameter deviceData with title: ${device.title}');
    DialogResponse? response = await _dialogService.showDialog(
      title: 'Alert',
      description: dialogDescDelProductTxt,
      buttonTitle: 'Yes',
      buttonTitleColor: black,
      cancelTitle: 'Cancel',
    );
    log.i('response confirmation is: ${response?.confirmed}');
    if (response?.confirmed == true) {
      // to delete the reference in fireStore
      try {
        _fireStoreDbService.removeRollerFromFS(device: device);
      } catch (e) {
        reusableFunction.snackBar(
            message:
                'unable to delete ${device.title} from fireStore, contact developer. Has Error: ${e.toString()}',
            duration: const Duration(seconds: 2));
      }
      // to delete the reference in cloudStorage
      try {
        _cloudStorageService.removeRollerFromStorage(device);
      } catch (e) {
        reusableFunction.snackBar(
            message:
                'unable to delete ${device.title} from cloudStorage, contact developer. Has Error: ${e.toString()}',
            duration: const Duration(seconds: 2));
      }
    }
  }

  realtimeOperations() {
    callRollerRealtimeUpdate();
  }

  void callRollerRealtimeUpdate() {
    _fireStoreDbService.getRollerRealtimeUpdate();
  }
}
