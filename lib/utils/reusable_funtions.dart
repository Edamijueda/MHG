import 'package:mhg/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ReusableFunction {
  final SnackbarService _snackBarService = locator<SnackbarService>();

  void snackBar({required String message}) {
    _snackBarService.showSnackbar(message: message);
  }
}
