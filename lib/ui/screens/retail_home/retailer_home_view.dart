import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/screens/retail_home/retailer_home_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:mhg/ui/screens/customer_home/customer_home_components.dart';
import 'package:stacked/stacked.dart';
import '../../../constants.dart';
import '../helpers/reusable_widgets.dart';
import '../reusable_views_components.dart';

enum Flowers {
  designers,
  midGrade,
  lightDepthPremium,
  lightDept,
  affordable,
  shakes,
  dcHarvest,
  organic
}

enum Carts {
  cbdCart,
  delta8Cart,
  thcCart,
}

enum Edibles {
  candy,
  chocolate,
  bummies,
  honey,
  cake,
  drink,
  cannabudder,
  oils,
  capsule,
  distillate
}

enum Extracts {
  shatter,
  hash,
  wax,
  kief,
  diamond,
  crumble,
  budder,
  preRoll,
  moonRock,
  distillate,
}

enum GearsAndMerch {
  art,
  tShirt,
  hoodies,
  accessories,
  socks,
  rollingVaper,
}

class RetailerHomeView extends StatefulWidget {
  const RetailerHomeView({Key? key}) : super(key: key);

  @override
  _RetailerHomeViewState createState() => _RetailerHomeViewState();
}

class _RetailerHomeViewState extends State<RetailerHomeView>
    with SingleTickerProviderStateMixin {
  final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();

  static int _selectedIndex = 0;

  late final TabController _controller = TabController(length: 5, vsync: this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    //_controller = TabController(length: tabs.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  static String getTextFromSelectedTab() {
    if (_selectedIndex == 0) {
      return flowerTxt;
    }
    if (_selectedIndex == 1) {
      return cartTxt;
    }
    if (_selectedIndex == 2) {
      return edibleTxt;
    }
    if (_selectedIndex == 3) {
      return extractTxt;
    }
    if (_selectedIndex == 4) {
      return gearTxt;
    }
    return flowerTxt;
  }

  String selectedSubCat = '';

  void _setSelectedSubCat(String input) {
    selectedSubCat = input;
  }

  String _getSelectedSubCat() {
    return selectedSubCat;
  }

  Future<void> _selectFlowerSubCategory() async {
    switch (await showDialog<Flowers>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            //titlePadding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
            //title: const Text('Select assignment'),
            //contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            backgroundColor: primaryColour,
            insetPadding: const EdgeInsets.symmetric(
                horizontal: 60.0, vertical: 36.0), //40,24
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text(
                  'Designer Flowers',
                  style: textStyle14FW400White,
                ),
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Designer Flowers');
                  });
                  Navigator.pop(context, Flowers.designers);
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  'Mid Grade',
                  style: textStyle14FW400White,
                ),
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Mid Grade');
                  });
                  Navigator.pop(context, Flowers.midGrade);
                },
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Light Depth Premium');
                  });
                  Navigator.pop(context, Flowers.lightDepthPremium);
                },
                child: const Text(
                  'Light Depth Premium',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Light Depth');
                  });
                  Navigator.pop(context, Flowers.lightDept);
                },
                child: const Text(
                  'Light Depth',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Affordable');
                  });
                  Navigator.pop(context, Flowers.affordable);
                },
                child: const Text(
                  'Affordable',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Shakes');
                  });
                  Navigator.pop(context, Flowers.shakes);
                },
                child: const Text(
                  'Shakes',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('DC Harvest');
                  });
                  Navigator.pop(context, Flowers.dcHarvest);
                },
                child: const Text(
                  'DC Harvest',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Organic');
                  });
                  Navigator.pop(context, Flowers.organic);
                },
                child: const Text(
                  'Organic',
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Flowers.designers:
        //_setSelectedSubCat('Designer Flowers');
        // Let's go.
        // ...
        break;
      case Flowers.midGrade:
        //_setSelectedSubCat('Mid Grade');
        // ...
        break;
      case Flowers.lightDepthPremium:
        // TODO: Handle this case.
        break;
      case Flowers.lightDept:
        // TODO: Handle this case.
        break;
      case Flowers.affordable:
        // TODO: Handle this case.
        break;
      case Flowers.shakes:
        // TODO: Handle this case.
        break;
      case Flowers.dcHarvest:
        // TODO: Handle this case.
        break;
      case Flowers.organic:
        // TODO: Handle this case.
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  Future<void> _selectCartSubCategory() async {
    switch (await showDialog<Carts>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            //titlePadding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
            //title: const Text('Select assignment'),
            //contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            backgroundColor: primaryColour,
            insetPadding: const EdgeInsets.symmetric(
                horizontal: 60.0, vertical: 36.0), //40,24
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('CBD Carts');
                  });
                  Navigator.pop(context, Carts.cbdCart);
                },
                child: const Text(
                  'CBD Carts',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Delta8 Carts');
                  });
                  Navigator.pop(context, Carts.delta8Cart);
                },
                child: const Text(
                  'Delta8 Carts',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('THC Carts');
                  });
                  Navigator.pop(context, Carts.thcCart);
                },
                child: const Text(
                  'THC Carts',
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Carts.cbdCart:
        // TODO: Handle this case.
        break;
      case Carts.delta8Cart:
        // TODO: Handle this case.
        break;
      case Carts.thcCart:
        // TODO: Handle this case.
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  Future<void> _selectEdibleSubCategory() async {
    switch (await showDialog<Edibles>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            //titlePadding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
            //title: const Text('Select assignment'),
            //contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            backgroundColor: primaryColour,
            insetPadding: const EdgeInsets.symmetric(
                horizontal: 60.0, vertical: 36.0), //40,24
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Candy');
                  });
                  Navigator.pop(context, Edibles.candy);
                },
                child: const Text(
                  'Candy',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Chocolate');
                  });
                  Navigator.pop(context, Edibles.chocolate);
                },
                child: const Text(
                  'Chocolate',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Bummies');
                  });
                  Navigator.pop(context, Edibles.bummies);
                },
                child: const Text(
                  'Bummies',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Honey');
                  });
                  Navigator.pop(context, Edibles.honey);
                },
                child: const Text(
                  'Honey',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Cake');
                  });
                  Navigator.pop(context, Edibles.cake);
                },
                child: const Text(
                  'Cake',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Drinks');
                  });
                  Navigator.pop(context, Edibles.drink);
                },
                child: const Text(
                  'Drinks',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Cannabudder');
                  });
                  Navigator.pop(context, Edibles.cannabudder);
                },
                child: const Text(
                  'Cannabudder',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Oils');
                  });
                  Navigator.pop(context, Edibles.oils);
                },
                child: const Text(
                  'Oils',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Capsule');
                  });
                  Navigator.pop(context, Edibles.capsule);
                },
                child: const Text(
                  'Capsule',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Distillate');
                  });
                  Navigator.pop(context, Edibles.distillate);
                },
                child: const Text(
                  'Distillate',
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Edibles.candy:
        // TODO: Handle this case.
        break;
      case Edibles.chocolate:
        // TODO: Handle this case.
        break;
      case Edibles.bummies:
        // TODO: Handle this case.
        break;
      case Edibles.honey:
        // TODO: Handle this case.
        break;
      case Edibles.cake:
        // TODO: Handle this case.
        break;
      case Edibles.drink:
        // TODO: Handle this case.
        break;
      case Edibles.cannabudder:
        // TODO: Handle this case.
        break;
      case Edibles.oils:
        // TODO: Handle this case.
        break;
      case Edibles.capsule:
        // TODO: Handle this case.
        break;
      case Edibles.distillate:
        // TODO: Handle this case.
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  Future<void> _selectExtractSubCategory() async {
    switch (await showDialog<Extracts>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            //titlePadding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
            //title: const Text('Select assignment'),
            //contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            backgroundColor: primaryColour,
            insetPadding: const EdgeInsets.symmetric(
                horizontal: 60.0, vertical: 36.0), //40,24
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Shatter');
                  });
                  Navigator.pop(context, Extracts.shatter);
                },
                child: const Text(
                  'Shatter',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Hash');
                  });
                  Navigator.pop(context, Extracts.hash);
                },
                child: const Text(
                  'Hash',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Wax');
                  });
                  Navigator.pop(context, Extracts.wax);
                },
                child: const Text(
                  'Wax',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Kief');
                  });
                  Navigator.pop(context, Extracts.kief);
                },
                child: const Text(
                  'Kief',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Diamond');
                  });
                  Navigator.pop(context, Extracts.diamond);
                },
                child: const Text(
                  'Diamond',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Crumbles');
                  });
                  Navigator.pop(context, Extracts.crumble);
                },
                child: const Text(
                  'Crumbles',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Budder');
                  });
                  Navigator.pop(context, Extracts.budder);
                },
                child: const Text(
                  'Budder',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('PreRolls');
                  });
                  Navigator.pop(context, Extracts.preRoll);
                },
                child: const Text(
                  'PreRolls',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('MoonRock');
                  });
                  Navigator.pop(context, Extracts.moonRock);
                },
                child: const Text(
                  'MoonRocks',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Distillate');
                  });
                  Navigator.pop(context, Extracts.distillate);
                },
                child: const Text(
                  'Distillates',
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Extracts.shatter:
        // TODO: Handle this case.
        break;
      case Extracts.hash:
        // TODO: Handle this case.
        break;
      case Extracts.wax:
        // TODO: Handle this case.
        break;
      case Extracts.kief:
        // TODO: Handle this case.
        break;
      case Extracts.diamond:
        // TODO: Handle this case.
        break;
      case Extracts.crumble:
        // TODO: Handle this case.
        break;
      case Extracts.budder:
        // TODO: Handle this case.
        break;
      case Extracts.preRoll:
        // TODO: Handle this case.
        break;
      case Extracts.moonRock:
        // TODO: Handle this case.
        break;
      case Extracts.distillate:
        // TODO: Handle this case.
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  Future<void> _selectGearAndMerchSubCategory() async {
    switch (await showDialog<GearsAndMerch>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            //titlePadding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
            //title: const Text('Select assignment'),
            //contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            backgroundColor: primaryColour,
            insetPadding: const EdgeInsets.symmetric(
                horizontal: 60.0, vertical: 36.0), //40,24
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Art');
                  });
                  Navigator.pop(context, GearsAndMerch.art);
                },
                child: const Text(
                  'ART - Print & Digital',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('T-shirts');
                  });
                  Navigator.pop(context, GearsAndMerch.tShirt);
                },
                child: const Text(
                  'T-shirts',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Hoodies');
                  });
                  Navigator.pop(context, GearsAndMerch.hoodies);
                },
                child: const Text(
                  'Hoodies',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('accessories');
                  });
                  Navigator.pop(context, GearsAndMerch.accessories);
                },
                child: const Text(
                  'HeadShop Accessories',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Socks');
                  });
                  Navigator.pop(context, GearsAndMerch.socks);
                },
                child: const Text(
                  'Socks',
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat('Vapes');
                  });
                  Navigator.pop(context, GearsAndMerch.rollingVaper);
                },
                child: const Text(
                  'Rolling Vapes',
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case GearsAndMerch.art:
        // TODO: Handle this case.
        break;
      case GearsAndMerch.tShirt:
        // TODO: Handle this case.
        break;
      case GearsAndMerch.hoodies:
        // TODO: Handle this case.
        break;
      case GearsAndMerch.accessories:
        // TODO: Handle this case.
        break;
      case GearsAndMerch.socks:
        // TODO: Handle this case.
        break;
      case GearsAndMerch.rollingVaper:
        // TODO: Handle this case.
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RetailerHomeViewModel>.reactive(
      viewModelBuilder: () => RetailerHomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
          title: MhgAppBarTitleWidget(),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.fromLTRB(
                  6.0, 2.0, 6.0, 2.0), //from default 8.0
              icon: buildIcon(icon: cartIcon, color: black),
              onPressed: () => _mhgBaseViewModel.goToCartScreen(),
            )
          ],
        ),
        drawer: NavDrawer(mhgBaseViewModel: _mhgBaseViewModel),
        body: FractionallySizedBox(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: Container(
            padding: EdgeInsets.only(top: 15.0),
            decoration: BoxDecoration(
              color: backgroundColour,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Categories', style: textStyleBlackBold16),
                          SizedBox(height: 10.0),
                          Container(
                            height: 3.0,
                            width: 130.0,
                            color: primaryColour,
                          ),
                        ],
                      ),
                      Spacer(),
                      buildCustomTextField(
                        sizeOfTF: sizeW165H30,
                        tfPadding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        hintTS: TextStyle(
                          fontSize: 12.0,
                          color: grey,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.2,
                        ),
                        hintText: searchItemHintTxt,
                        prefixIcon: buildIcon(
                            icon: searchIcon, color: grey, size: 20.0),
                        inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey),
                          borderRadius: borderRadius10,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, bottom: 10.0),
                  child: TabBar(
                    controller: _controller,
                    padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                    indicatorPadding: const EdgeInsets.fromLTRB(
                        5.0, 10.0, 15.0, 7.0), //8.0, 10.0, 18.0, 6.0
                    labelPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    indicator: BoxDecoration(
                      color: primaryColour,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: 100.0,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 8.0,
                                right:
                                    4.0), //EdgeInsets.symmetric(horizontal: 8.0),
                            leading: Text(
                              flowerTxt,
                              style: (getTextFromSelectedTab() != flowerTxt)
                                  ? textStyle14FW400DarkGrey
                                  : textStyle14FW400White,
                            ),
                            trailing: (getTextFromSelectedTab() != flowerTxt)
                                ? null
                                : IconButton(
                                    padding: const EdgeInsets.all(8.0),
                                    icon: buildIcon(
                                      icon: moreOptionIcon,
                                      color: white,
                                      size: iconBtnSize,
                                    ),
                                    onPressed: () => _selectFlowerSubCategory(),
                                  ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 90.0,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 8.0,
                                right:
                                    4.0), //EdgeInsets.symmetric(horizontal: 8.0),
                            leading: Text(
                              cartTxt,
                              style: (getTextFromSelectedTab() != cartTxt)
                                  ? textStyle14FW400DarkGrey
                                  : textStyle14FW400White,
                            ),
                            trailing: (getTextFromSelectedTab() != cartTxt)
                                ? null
                                : IconButton(
                                    padding: const EdgeInsets.all(8.0),
                                    icon: buildIcon(
                                      icon: moreOptionIcon,
                                      color: white,
                                      size: iconBtnSize,
                                    ),
                                    onPressed: () => _selectCartSubCategory(),
                                  ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100.0,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 8.0,
                                right:
                                    4.0), //EdgeInsets.symmetric(horizontal: 8.0),
                            leading: Text(
                              edibleTxt,
                              style: (getTextFromSelectedTab() != edibleTxt)
                                  ? textStyle14FW400DarkGrey
                                  : textStyle14FW400White,
                            ),
                            trailing: (getTextFromSelectedTab() != edibleTxt)
                                ? null
                                : IconButton(
                                    padding: const EdgeInsets.all(8.0),
                                    icon: buildIcon(
                                      icon: moreOptionIcon,
                                      color: white,
                                      size: iconBtnSize,
                                    ),
                                    onPressed: () => _selectEdibleSubCategory(),
                                  ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 108.0,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 8.0,
                                right:
                                    4.0), //EdgeInsets.symmetric(horizontal: 8.0),
                            leading: Text(
                              extractTxt,
                              style: (getTextFromSelectedTab() != extractTxt)
                                  ? textStyle14FW400DarkGrey
                                  : textStyle14FW400White,
                            ),
                            trailing: (getTextFromSelectedTab() != extractTxt)
                                ? null
                                : IconButton(
                                    padding: const EdgeInsets.all(8.0),
                                    icon: buildIcon(
                                      icon: moreOptionIcon,
                                      color: white,
                                      size: iconBtnSize,
                                    ),
                                    onPressed: () =>
                                        _selectExtractSubCategory(),
                                  ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 145.0,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 8.0,
                                right:
                                    4.0), //EdgeInsets.symmetric(horizontal: 8.0),
                            leading: Text(
                              gearTxt,
                              style: (getTextFromSelectedTab() != gearTxt)
                                  ? textStyle14FW400DarkGrey
                                  : textStyle14FW400White,
                            ),
                            trailing: (getTextFromSelectedTab() != gearTxt)
                                ? null
                                : IconButton(
                                    padding: const EdgeInsets.all(8.0),
                                    icon: buildIcon(
                                      icon: moreOptionIcon,
                                      color: white,
                                      size: iconBtnSize,
                                    ),
                                    onPressed: () =>
                                        _selectGearAndMerchSubCategory(),
                                  ),
                          ),
                        ),
                      ),
                    ],
                    isScrollable: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Text(
                        getTextFromSelectedTab(),
                        //'Testing',
                        //getTextFromSelectedTab(),
                        style: textStyle14FW400WithPColour,
                      ),
                      buildIcon(
                        icon: doubleArrowIcon,
                        color: primaryColour,
                        size: 14.0,
                      ),
                      Text(_getSelectedSubCat(),
                          style: textStyle14FW400WithPColour),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6, //0.7, //(1 / 2)
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 6.0,
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        children: <Widget>[
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/electric_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/stash_jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/mill_and_fill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/dab_ring.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                        ],
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6, //0.7, //(1 / 2)
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 6.0,
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        children: <Widget>[
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/stash_jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/mill_and_fill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/electric_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/dab_ring.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                        ],
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6, //0.7, //(1 / 2)
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 6.0,
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        children: <Widget>[
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/electric_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/stash_jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/mill_and_fill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/dab_ring.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                        ],
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6, //0.7, //(1 / 2)
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 6.0,
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        children: <Widget>[
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/electric_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/stash_jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/mill_and_fill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/dab_ring.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                        ],
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6, //0.7, //(1 / 2)
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 6.0,
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        children: <Widget>[
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/mill_and_fill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/electric_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/stash_jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/dab_ring.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/herb_grinder.png',
                            deviceName: herbGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource:
                                'lib/assets/otto_mill_fill_grinder.png',
                            deviceName: ottoMillFillGrinderTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/rok_dab_rig.png',
                            deviceName: electricDabRigTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/otto_mill.png',
                            deviceName: ottoMillAndFillTxt,
                          ),
                          DeviceDetailsCard(
                            imageSource: 'lib/assets/jar.png',
                            deviceName: herbGrinderTxt,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
