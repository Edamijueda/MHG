import 'package:flutter/material.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_view_model.dart';
import 'package:mhg/ui/screens/admin/alert/view.dart';
import 'package:mhg/ui/screens/admin/devices/view.dart';
import 'package:mhg/ui/screens/admin/retail/view.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_view.dart';
import 'package:mhg/ui/screens/customer/components.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView>
    with SingleTickerProviderStateMixin {
  //final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();
  final log = getStackedLogger('_AdminHomeViewState');

  static int _selectedTierIndex = 0;

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
    return ViewModelBuilder<AdminHomeViewModel>.reactive(
      disposeViewModel: false,
      // Tells the viewModelBuilder that we only want to initialise the SVM once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => AdminHomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: grey, //backgroundColour,
        //Colors.tealAccent,//backgroundColour,
        body: getViewForIndex(model.currentIndex, model),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Upload',
              icon: Icon(Icons.upload_file),
            ),
            BottomNavigationBarItem(
              label: 'Alert',
              icon: Icon(Icons.info_outline),
            ),
            /*BottomNavigationBarItem(
              label: 'Sold',
              icon: Icon(Icons.add_task_outlined),
            ),*/
            /*BottomNavigationBarItem(
              label: 'Stat',
              icon: Icon(Icons.insert_chart_outlined),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget getViewForIndex(int index, AdminHomeViewModel model) {
    switch (index) {
      case 0:
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15.0), // prev top: 5.0
                color: Colors.teal.shade800,
                child: Row(
                  children: [
                    Expanded(
                      child: build2ColumnTabBar(
                        text4column1: customerTxt,
                        text4column2: tempRetailer,
                        textStyle: textStyleWhiteBold16,
                      ),
                    ),
                    IconButton(
                      onPressed: () => model.logout(),
                      icon: Icon(
                        logoutIcon,
                        color: Colors.red,
                        size: 20.0,
                      ),
                      tooltip: logoutTxt,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            color: backgroundColour, //white,
                            child: build2ColumnTabBar(
                              text4column1: artworkTxt,
                              text4column2: deviceTxt,
                              textStyle: textStyleBlackBold16,
                              provideIndicatorSize: TabBarIndicatorSize.label,
                              indicatorDeco: const UnderlineTabIndicator(
                                borderSide: BorderSide(color: teal),
                                insets:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    TiersTabBar(
                                        controller: _tiersTabController),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _tiersTabController,
                                        children: [
                                          Admin1stTierView(
                                            tierType: firstTierTxt,
                                            artworkType: firstTierArtworkTxt,
                                          ),
                                          Admin1stTierView(
                                            tierType: secondTierTxt,
                                            artworkType: secondTierArtworkTxt,
                                          ),
                                          Admin1stTierView(
                                            tierType: thirdTierTxt,
                                            artworkType: thirdTierArtworkTxt,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                AdminDeviceView(),
                                /*Container(
                                  // width: 250.0,
                                  // height: 250.0,
                                  color: Colors.tealAccent,
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    RetailView(),
                    /*Container(
                      // width: 250.0,
                      // height: 250.0,
                      color: Colors.deepOrange,
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ); //UploadView();
      case 1:
        return AlertView(); //AlertView();
      /*case 2:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.blueGrey,
        ); //SoldItemsView();*/
      /*case 3:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.indigo,
        ); //StatView();*/
      default:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.brown,
          alignment: Alignment.center,
          child: Text(
              'Default. since other BottomNavView case fail. Contact developer'),
        ); //UploadView();
    }
  }
}
