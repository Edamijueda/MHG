// This class StackedApp takes in a list of route which uses d same route dart d
// auto_route package has defined, with slight name changes.
import 'package:mhg/core/services/authentication/authentication.dart';
import 'package:mhg/core/services/cloud_storage.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/core/services/user/firestore.dart';
import 'package:mhg/core/services/user/storage.dart';
import 'package:mhg/ui/screens/account_settings/account_settings_view.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_view.dart';
import 'package:mhg/ui/screens/cart/cart_view.dart';
import 'package:mhg/ui/screens/customer/view.dart';
import 'package:mhg/ui/screens/help/help_view.dart';
import 'package:mhg/ui/screens/order_history/order_history_view.dart';
import 'package:mhg/ui/screens/retail/view.dart';
import 'package:mhg/ui/screens/saved_items/saved_items_view.dart';
import 'package:mhg/ui/screens/sign_up/signup_view.dart';
import 'package:mhg/ui/screens/user_access/user_access_view.dart';
import 'package:mhg/utils/image_selector.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: UserAccessView,
      initial: true,
    ),
    MaterialRoute(
      page: SignUpView,
    ),
    MaterialRoute(
      page: CustomerView,
    ),
    MaterialRoute(
      page: RetailUserView,
    ),
    MaterialRoute(
      page: SavedItemsView,
    ),
    MaterialRoute(
      page: AccountSettingsView,
    ),
    MaterialRoute(
      page: CartView,
    ),
    MaterialRoute(
      page: HelpView,
    ),
    MaterialRoute(
      page: OrderHistoryView,
    ),
    MaterialRoute(
      page: AdminHomeView,
    ),
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: SnackbarService,
    ),
    LazySingleton(
      classType: DialogService,
    ),
    LazySingleton(
      classType: AuthenticationService,
    ),
    LazySingleton(
      classType: CloudStorageService,
    ),
    LazySingleton(
      classType: ImageSelector,
    ),
    LazySingleton(
      classType: FirestoreDbService,
    ),
    LazySingleton(
      classType: UserStorageService,
    ),
    LazySingleton(
      classType: UserFsService,
    ),
  ],
  logger: StackedLogger(logHelperName: 'getStackedLogger'),
)
class AppSetUp {
  // Serves no purpose at the moment besides having an annotation attached

}
