import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/app/app.router.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/core/services/user/firestore.dart';
import 'package:mhg/ui/screens/cart/cart_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// BUSINESS LOGIC AND INTERACTION WITH THE SERVICES
// Once you change sth in dis viewModel you will be able to call notifyListener() which
// will rebuild that builder as u see in d reactive constructor(on the model's VIEW)
class CustomerViewModel extends ReactiveViewModel {
  final logger = getStackedLogger('CustomerViewModel');
  final _navService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final UserFsService _userFsService = locator<UserFsService>();
  final List<Device>? _cartItems = List<Device>.empty(growable: true);

  List<Device>? get cartItems => _cartItems;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userFsService];

  // ReactiveService value getters
  List<Device>? get rCartItems => _userFsService.rCartItems;

  void goToNextScreen() {
    _navService.navigateTo(Routes.signUpView);
  }

  // Dis method will be implemented in the 3tiers classes
  // Future viewDetails(Artwork artwork);
  Future viewDetails(Artwork artwork, String type) async {
    logger.i('parameter artwork with title: ${artwork.title}');
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.productDetails,
      hasImage: true,
      barrierDismissible: true,
      imageUrl: artwork.url,
      title: artwork.title,
      description: artwork.description,
      showIconInMainButton: true,
      data: artwork,
    );
    if (response?.confirmed == true) {
      _userFsService.addItemToCart(Device(
        url: artwork.url!,
        title: artwork.title!,
        description: artwork.description!,
        price: artwork.price!,
        deviceType: type,
        id: artwork.id,
      ));
      // notifyListeners();
      // logger.i('_cartItems length is: ${_cartItems?.length}');
      // logger.i('cartItems length is: ${cartItems?.length}');
    }
    //notifyListeners();
  }

  /*void lengthOfCartItems(){
    log.i('no param. cart length is: ${_cartItems?.length}');
  }*/

  void goToCartScreen() {
    _navService.navigateToView(CartView(cartItems: _cartItems));
  }

  void addToCartItems(Device device) {
    logger.i('parameter device with title: ${device.title}');
    _userFsService.addItemToCart(device);
  }

  remFromCartItems(Device device) {
    logger.i('parameter device with title: ${device.title}');
    _userFsService.removeItem(device);
  }
}
