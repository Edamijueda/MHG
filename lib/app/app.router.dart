// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/screens/account_settings/account_settings_view.dart';
import '../ui/screens/admin/admin_home/admin_home_view.dart';
import '../ui/screens/cart/cart_view.dart';
import '../ui/screens/customer_home/customer_home_view.dart';
import '../ui/screens/help/help_view.dart';
import '../ui/screens/order_history/order_history_view.dart';
import '../ui/screens/retail_home/retailer_home_view.dart';
import '../ui/screens/saved_items/saved_items_view.dart';
import '../ui/screens/sign_up/signup_view.dart';
import '../ui/screens/user_access/user_access_view.dart';

class Routes {
  static const String userAccessView = '/';
  static const String signUpView = '/sign-up-view';
  static const String customerHomeView = '/customer-home-view';
  static const String retailerHomeView = '/retailer-home-view';
  static const String savedItemsView = '/saved-items-view';
  static const String accountSettingsView = '/account-settings-view';
  static const String cartView = '/cart-view';
  static const String helpView = '/help-view';
  static const String orderHistoryView = '/order-history-view';
  static const String adminHomeView = '/admin-home-view';
  static const all = <String>{
    userAccessView,
    signUpView,
    customerHomeView,
    retailerHomeView,
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
    RouteDef(Routes.customerHomeView, page: CustomerHomeView),
    RouteDef(Routes.retailerHomeView, page: RetailerHomeView),
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
    CustomerHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CustomerHomeView(),
        settings: data,
      );
    },
    RetailerHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RetailerHomeView(),
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
