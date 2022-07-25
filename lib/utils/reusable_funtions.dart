import 'package:image_picker/image_picker.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

import 'image_selector.dart';

class ReusableFunc {
  static final log = getStackedLogger('ReusableFunc');
  final SnackbarService _snackBarService = locator<SnackbarService>();
  static final ImageSelector _imageSelector = locator<ImageSelector>();

  void snackBar({required String message, required Duration duration}) {
    _snackBarService.showSnackbar(message: message, duration: duration);
  }

  static Future<XFile?> selectImage() async {
    log.i('no param');
    try {
      var selectedImage = await _imageSelector.selectImage();
      return selectedImage;
      //_selectedImage = tempImage;
      //log.i('_selectedImage is: ${_selectedImage?.path}');
      //notifyListeners();
    } catch (e) {
      log.i('error message: ${e.toString()}');
      /*reusableFunction.snackBar(
          message: 'File selection fail: ${e.toString()}',
          duration: const Duration(seconds: 1));*/
    }
    return null;
  }
}
