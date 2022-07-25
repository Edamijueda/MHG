import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/ui/screens/customer/view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomerDeviceViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final log = getStackedLogger('CustomerDeviceViewModel');
  final CustomerViewModel _customerViewModel = CustomerViewModel();

  Future viewDeviceDetails(Device device) async {
    log.i('parameter device with title: ${device.title}');
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.productDetails,
      hasImage: true,
      barrierDismissible: true,
      imageUrl: device.url,
      title: device.title,
      description: device.description,
      showIconInMainButton: true,
      data: device,
    );
    if (response?.confirmed == true) {
      _customerViewModel.addToCartItems(device);
    }
  }
}
