// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/models/profile/profile.dart';
import '../ui/screens/account_settings/account_settings_view.dart';
import '../ui/screens/admin/admin_home/admin_home_view.dart';
import '../ui/screens/cart/cart_view.dart';
import '../ui/screens/customer/view.dart';
import '../ui/screens/help/help_view.dart';
import '../ui/screens/order_history/order_history_view.dart';
import '../ui/screens/retail/view.dart';
import '../ui/screens/saved_items/saved_items_view.dart';
import '../ui/screens/sign_up/signup_view.dart';
import '../ui/screens/user_access/user_access_view.dart';

class Routes {
  static const String userAccessView = '/';
  static const String signUpView = '/sign-up-view';
  static const String customerView = '/customer-view';
  static const String retailUserView = '/retail-user-view';
  static const String savedItemsView = '/saved-items-view';
  static const String accountSettingsView = '/account-settings-view';
  static const String cartView = '/cart-view';
  static const String helpView = '/help-view';
  static const String orderHistoryView = '/order-history-view';
  static const String adminHomeView = '/admin-home-view';
  static const all = <String>{
    userAccessView,
    signUpView,
    customerView,
    retailUserView,
    savedItemsView,
    accountSettingsView,
    cartView,
    helpView,
    orderHistoryView,
    adminHomeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.userAccessView, page: UserAccessView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.customerView, page: CustomerView),
    RouteDef(Routes.retailUserView, page: RetailUserView),
    RouteDef(Routes.savedItemsView, page: SavedItemsView),
    RouteDef(Routes.accountSettingsView, page: AccountSettingsView),
    RouteDef(Routes.cartView, page: CartView),
    RouteDef(Routes.helpView, page: HelpView),
    RouteDef(Routes.orderHistoryView, page: OrderHistoryView),
    RouteDef(Routes.adminHomeView, page: AdminHomeView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    UserAccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserAccessView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    CustomerView: (data) {
      var args = data.getArgs<CustomerViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerView(
          key: args.key,
          profile: args.profile,
        ),
        settings: data,
      );
    },
    RetailUserView: (data) {
      var args = data.getArgs<RetailUserViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RetailUserView(
          key: args.key,
          profile: args.profile,
        ),
        settings: data,
      );
    },
    SavedItemsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SavedItemsView(),
        settings: data,
      );
    },
    AccountSettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AccountSettingsView(),
        settings: data,
      );
    },
    CartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CartView(),
        settings: data,
      );
    },
    HelpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HelpView(),
        settings: data,
      );
    },
    OrderHistoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OrderHistoryView(),
        settings: data,
      );
    },
    AdminHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AdminHomeView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CustomerView arguments holder class
class CustomerViewArguments {
  final Key? key;
  final UserProfile profile;
  CustomerViewArguments({this.key, required this.profile});
}

/// RetailUserView arguments holder class
class RetailUserViewArguments {
  final Key? key;
  final UserProfile profile;
  RetailUserViewArguments({this.key, required this.profile});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToUserAccessView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userAccessView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSignUpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.signUpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCustomerView({
    Key? key,
    required UserProfile profile,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.customerView,
      arguments: CustomerViewArguments(key: key, profile: profile),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRetailUserView({
    Key? key,
    required UserProfile profile,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.retailUserView,
      arguments: RetailUserViewArguments(key: key, profile: profile),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSavedItemsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.savedItemsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAccountSettingsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountSettingsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCartView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.cartView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHelpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.helpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOrderHistoryView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.orderHistoryView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminHomeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
