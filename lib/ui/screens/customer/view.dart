import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/profile/profile.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/screens/customer/device/view.dart';
import 'package:mhg/ui/screens/customer/tier1/view.dart';
import 'package:mhg/ui/screens/customer/tier2/view.dart';
import 'package:mhg/ui/screens/customer/tier3/view.dart';
import 'package:mhg/ui/screens/customer/view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

import '../helpers/reusable_widgets.dart';
import '../reusable_views_components.dart';
import 'components.dart';

class CustomerView extends StatefulWidget {
  final UserProfile profile;

  const CustomerView({Key? key, required this.profile}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView>
    with SingleTickerProviderStateMixin {
  final log = getStackedLogger('_CustomerViewState');
  static int _selectedTierIndex = 0;
  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  late final TabController _tiersTabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    //_controller = TabController(length: tabs.length, vsync: this);

    _tiersTabController.addListener(() {
      setState(() {
        _selectedTierIndex = _tiersTabController.index;
      });
      log.i("Selected Index: " + _tiersTabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    log.i('userProfile has userType: ${widget.profile.userType} \n'
        'uid: ${widget.profile.uid}');
    return ViewModelBuilder<CustomerViewModel>.reactive(
      viewModelBuilder: () => CustomerViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            backgroundColor: white,
            //Colors.white,
            foregroundColor: Colors.black,
            //elevation: 0.0,
            title: MhgAppBarTitleWidget(),
            actions: <Widget>[
              const MyBadge(),
              SizedBox(width: 20.0)
              /*Stack(
                children: [
                  buildIcon(icon: cartIcon, color: black),
                  */ /*IconButton(
                    padding: const EdgeInsets.fromLTRB(
                        6.0, 2.0, 6.0, 2.0), //from default 8.0
                    icon: buildIcon(icon: cartIcon, color: black),
                    onPressed: () => model.goToCartScreen(),
                  ),*/ /*
                  (model.cartItems == null && model.cartItems?.isEmpty)
                      ? SizedBox.shrink()
                      : Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Text('${model.cartItems?.length}'),
                        ),
                ],
              ),*/
            ],
            bottom: build2ColumnTabBar(
              text4column1: artworkTxt,
              text4column2: deviceTxt,
              textStyle: textStyleBlackBold16,
            ),
          ),
          drawer: NavDrawer(
            mhgBaseViewModel: _mhgBaseViewModel,
            profile: widget.profile,
          ),
          body: Container(
            color: greyLike, //backgroundColour,
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          TiersTabBar(controller: _tiersTabController),
                          Expanded(
                            child: TabBarView(
                              controller: _tiersTabController,
                              children: [
                                CustomerTier1View(),
                                CustomerTier2View(),
                                CustomerTier3View(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomerDeviceView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //onModelReady: (model) => model.callRealTimeOperations(),
    );
    /*return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          //Colors.white,
          foregroundColor: Colors.black,
          //elevation: 0.0,
          title: MhgAppBarTitleWidget(),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.fromLTRB(
                  6.0, 2.0, 6.0, 2.0), //from default 8.0
              icon: buildIcon(icon: cartIcon, color: black),
              onPressed: () => _mhgBaseViewModel.goToCartScreen(),
            )
          ],
          bottom: build2ColumnTabBar(
            text4column1: artworkTxt,
            text4column2: deviceTxt,
            textStyle: textStyleBlackBold16,
          ),
        ),
        drawer: NavDrawer(
          mhgBaseViewModel: _mhgBaseViewModel,
          profile: widget.profile,
        ),
        body: Container(
          color: greyLike, //backgroundColour,
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        TiersTabBar(controller: _tiersTabController),
                        Expanded(
                          child: TabBarView(
                            controller: _tiersTabController,
                            children: [
                              CustomerTier1View(),
                              CustomerTier2View(),
                              CustomerTier3View(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomerDeviceView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}

class MyBadge extends ViewModelWidget<CustomerViewModel> {
  const MyBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CustomerViewModel viewModel) {
    //CustomerViewModel model = CustomerViewModel();

    return InkWell(
      onTap: () => viewModel.goToCartScreen(),
      child: Tooltip(
        message: 'Cart items',
        child: Badge(
          /*padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0,
              4.0),*/ //The default value is EdgeInsets.all(5.0).
          badgeContent: Text(
            '${viewModel.rCartItems?.length}',
            style: TextStyle(fontSize: 10.0, color: white),
          ),
          child: buildIcon(icon: cartIcon, color: black),
          position: BadgePosition.topEnd(top: -2, end: -10),
          animationType: BadgeAnimationType.slide,
          showBadge: (viewModel.rCartItems == null) ? false : true,
        ),
      ),
    );
  }
}
