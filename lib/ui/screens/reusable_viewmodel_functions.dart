import 'package:mhg/app/app.locator.dart';
import 'package:mhg/constants.dart';
import 'package:stacked_services/stacked_services.dart';

final DialogService _dialogService = locator<DialogService>();

/*
Future showBasicDialog({required String title}) async {
  DialogResponse? response = await _dialogService.showConfirmationDialog(
    title: 'Alert',
    description: dialogDescTxt,
    confirmationTitle: 'Ok',
    cancelTitle: 'Cancel',
  );
}*/
