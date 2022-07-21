import 'package:flutter/material.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/retail/devices/cartridge/view.dart';
import 'package:mhg/ui/screens/admin/retail/devices/cartridge/viewmodel.dart';
import 'package:mhg/ui/screens/admin/retail/devices/edible/view.dart';
import 'package:mhg/ui/screens/admin/retail/devices/edible/viewmodel.dart';
import 'package:mhg/ui/screens/admin/retail/devices/extract/view.dart';
import 'package:mhg/ui/screens/admin/retail/devices/extract/viewmodel.dart';
import 'package:mhg/ui/screens/admin/retail/devices/flower/view.dart';
import 'package:mhg/ui/screens/admin/retail/devices/flower/viewmodel.dart';
import 'package:mhg/ui/screens/admin/retail/devices/gearAndMerch/view.dart';
import 'package:mhg/ui/screens/admin/retail/devices/gearAndMerch/viewmodel.dart';
import 'package:mhg/ui/screens/admin/retail/view_model.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class RetailView extends StatefulWidget {
  const RetailView({Key? key}) : super(key: key);

  @override
  State<RetailView> createState() => _RetailViewState();
}

class _RetailViewState extends State<RetailView>
    with SingleTickerProviderStateMixin {
  //AutomaticKeepAliveClientMixin
  final log = getStackedLogger('RetailView');
  final FlowerViewModel _flowerViewModel = FlowerViewModel();
  final CartridgeViewModel _cartridgeView = CartridgeViewModel();
  final EdibleViewModel _edibleViewModel = EdibleViewModel();
  final ExtractViewModel _extractViewModel = ExtractViewModel();
  final GearAndMerchViewModel _gearAndMerchViewModel = GearAndMerchViewModel();

  static int _selectedIndex = 0;
  static bool isChanging = false;

  late final TabController _controller = TabController(length: 5, vsync: this);
  static final RetailViewModel _retailViewModel = RetailViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    //_controller = TabController(length: tabs.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
        isChanging = _controller.indexIsChanging;
        if (!isChanging) {
          if (_selectedIndex == 0) {
            selectedSubCat = designFlowerTxt;
          } else if (_selectedIndex == 1) {
            selectedSubCat = cbdCartTxt;
          } else if (_selectedIndex == 2) {
            selectedSubCat = candyTxt;
          } else if (_selectedIndex == 3) {
            selectedSubCat = shatterTxt;
          } else {
            selectedSubCat = artPrintAndDigitalTxt;
          }
        }
      });
      log.i("Selected Index: " + _controller.index.toString());
    });
  }

  static String getTextFromSelectedTab() {
    if (_selectedIndex == 0) {
      _retailViewModel.setSelectedSubCat(designFlowerTxt);
      return flowerTxt;
    }
    if (_selectedIndex == 1) {
      _retailViewModel.setSelectedSubCat(cbdCartTxt);
      return cartTxt;
    }
    if (_selectedIndex == 2) {
      _retailViewModel.setSelectedSubCat(candyTxt);
      return edibleTxt;
    }
    if (_selectedIndex == 3) {
      _retailViewModel.setSelectedSubCat(shatterTxt);
      return extractTxt;
    }
    if (_selectedIndex == 4) {
      _retailViewModel.setSelectedSubCat(artPrintAndDigitalTxt);
      return gearTxt;
    }
    return flowerTxt;
  }

  static String selectedSubCat = designFlowerTxt;

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
                  designFlowerTxt,
                  style: textStyle14FW400White,
                ),
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(designFlowerTxt);
                  });
                  Navigator.pop(context, Flowers.designers);
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  midGradeTxt,
                  style: textStyle14FW400White,
                ),
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(midGradeTxt);
                  });
                  Navigator.pop(context, Flowers.midGrade);
                },
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(lightDepthPremiumTxt);
                  });
                  Navigator.pop(context, Flowers.lightDepthPremium);
                },
                child: const Text(
                  lightDepthPremiumTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(lightDepthTxt);
                  });
                  Navigator.pop(context, Flowers.lightDepth);
                },
                child: const Text(
                  lightDepthTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(affordableTxt);
                  });
                  Navigator.pop(context, Flowers.affordable);
                },
                child: const Text(
                  affordableTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(shakeTxt);
                  });
                  Navigator.pop(context, Flowers.shakes);
                },
                child: const Text(
                  shakeTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(dcHarvestTxt);
                  });
                  Navigator.pop(context, Flowers.dcHarvest);
                },
                child: const Text(
                  dcHarvestTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(organicTxt);
                  });
                  Navigator.pop(context, Flowers.organic);
                },
                child: const Text(
                  organicTxt,
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
        break;
      case Flowers.lightDepth:
        break;
      case Flowers.affordable:
        break;
      case Flowers.shakes:
        break;
      case Flowers.dcHarvest:
        break;
      case Flowers.organic:
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
                    _setSelectedSubCat(cbdCartTxt);
                  });
                  Navigator.pop(context, Carts.cbdCart);
                },
                child: const Text(
                  cbdCartTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(delta8CartTxt);
                  });
                  Navigator.pop(context, Carts.delta8Cart);
                },
                child: const Text(
                  delta8CartTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(thcCartTxt);
                  });
                  Navigator.pop(context, Carts.thcCart);
                },
                child: const Text(
                  thcCartTxt,
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Carts.cbdCart:
        break;
      case Carts.delta8Cart:
        break;
      case Carts.thcCart:
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
                    _setSelectedSubCat(candyTxt);
                  });
                  Navigator.pop(context, Edibles.candy);
                },
                child: const Text(
                  candyTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(chocolateTxt);
                  });
                  Navigator.pop(context, Edibles.chocolate);
                },
                child: const Text(
                  chocolateTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(bummieTxt);
                  });
                  Navigator.pop(context, Edibles.bummies);
                },
                child: const Text(
                  bummieTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(honeyTxt);
                  });
                  Navigator.pop(context, Edibles.honey);
                },
                child: const Text(
                  honeyTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(cakeTxt);
                  });
                  Navigator.pop(context, Edibles.cake);
                },
                child: const Text(
                  cakeTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(drinkTxt);
                  });
                  Navigator.pop(context, Edibles.drink);
                },
                child: const Text(
                  drinkTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(cannabudderTxt);
                  });
                  Navigator.pop(context, Edibles.cannabudder);
                },
                child: const Text(
                  cannabudderTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(oilTxt);
                  });
                  Navigator.pop(context, Edibles.oils);
                },
                child: const Text(
                  oilTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(capsuleTxt);
                  });
                  Navigator.pop(context, Edibles.capsule);
                },
                child: const Text(
                  capsuleTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(distillateTxt);
                  });
                  Navigator.pop(context, Edibles.edibleDistillate);
                },
                child: const Text(
                  distillateTxt,
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Edibles.candy:
        break;
      case Edibles.chocolate:
        break;
      case Edibles.bummies:
        break;
      case Edibles.honey:
        break;
      case Edibles.cake:
        break;
      case Edibles.drink:
        break;
      case Edibles.cannabudder:
        break;
      case Edibles.oils:
        break;
      case Edibles.capsule:
        break;
      case Edibles.edibleDistillate:
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
                    _setSelectedSubCat(shatterTxt);
                  });
                  Navigator.pop(context, Extracts.shatter);
                },
                child: const Text(
                  shatterTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(hashTxt);
                  });
                  Navigator.pop(context, Extracts.hash);
                },
                child: const Text(
                  hashTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(waxTxt);
                  });
                  Navigator.pop(context, Extracts.wax);
                },
                child: const Text(
                  waxTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(kiefTxt);
                  });
                  Navigator.pop(context, Extracts.kief);
                },
                child: const Text(
                  kiefTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(diamondTxt);
                  });
                  Navigator.pop(context, Extracts.diamond);
                },
                child: const Text(
                  diamondTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(crumblesTxt);
                  });
                  Navigator.pop(context, Extracts.crumble);
                },
                child: const Text(
                  crumblesTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(budderTxt);
                  });
                  Navigator.pop(context, Extracts.budder);
                },
                child: const Text(
                  budderTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(preRollTxt);
                  });
                  Navigator.pop(context, Extracts.preRoll);
                },
                child: const Text(
                  preRollTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(moonRockTxt);
                  });
                  Navigator.pop(context, Extracts.moonRock);
                },
                child: const Text(
                  moonRockTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(distillateTxt);
                  });
                  Navigator.pop(context, Extracts.extractDistillate);
                },
                child: const Text(
                  distillateTxt,
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case Extracts.shatter:
        break;
      case Extracts.hash:
        break;
      case Extracts.wax:
        break;
      case Extracts.kief:
        break;
      case Extracts.diamond:
        break;
      case Extracts.crumble:
        break;
      case Extracts.budder:
        break;
      case Extracts.preRoll:
        break;
      case Extracts.moonRock:
        break;
      case Extracts.extractDistillate:
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
                    _setSelectedSubCat(artPrintAndDigitalTxt);
                  });
                  Navigator.pop(context, GearsAndMerch.artPrintAndDigital);
                },
                child: const Text(
                  artPrintAndDigitalTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(tShirtTxt);
                  });
                  Navigator.pop(context, GearsAndMerch.tShirt);
                },
                child: const Text(
                  tShirtTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(hoodiesTxt);
                  });
                  Navigator.pop(context, GearsAndMerch.hoodies);
                },
                child: const Text(
                  hoodiesTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(accessoriesTxt);
                  });
                  Navigator.pop(context, GearsAndMerch.accessories);
                },
                child: const Text(
                  accessoriesTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(socksTxt);
                  });
                  Navigator.pop(context, GearsAndMerch.socks);
                },
                child: const Text(
                  socksTxt,
                  style: textStyle14FW400White,
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _setSelectedSubCat(rollingVapeTxt);
                  });
                  Navigator.pop(context, GearsAndMerch.rollingVaper);
                },
                child: const Text(
                  rollingVapeTxt,
                  style: textStyle14FW400White,
                ),
              ),
            ],
          );
        })) {
      case GearsAndMerch.artPrintAndDigital:
        break;
      case GearsAndMerch.tShirt:
        break;
      case GearsAndMerch.hoodies:
        break;
      case GearsAndMerch.accessories:
        break;
      case GearsAndMerch.socks:
        break;
      case GearsAndMerch.rollingVaper:
        break;
      case null:
        // dialog dismissed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RetailViewModel>.reactive(
      viewModelBuilder: () => RetailViewModel(),
      builder: (context, model, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 5.0, right: 5.0, bottom: 5.0), //bottom: 10.0
            child: TabBar(
              controller: _controller,
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
              indicatorPadding: const EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 7.0),
              //8.0, 10.0, 18.0, 6.0
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
                      contentPadding: EdgeInsets.only(left: 8.0, right: 4.0),
                      //EdgeInsets.symmetric(horizontal: 8.0),
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
                      contentPadding: EdgeInsets.only(left: 8.0, right: 4.0),
                      //EdgeInsets.symmetric(horizontal: 8.0),
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
                      contentPadding: EdgeInsets.only(left: 8.0, right: 4.0),
                      //EdgeInsets.symmetric(horizontal: 8.0),
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
                      contentPadding: EdgeInsets.only(left: 8.0, right: 4.0),
                      //EdgeInsets.symmetric(horizontal: 8.0),
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
                              onPressed: () => _selectExtractSubCategory(),
                            ),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 145.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 8.0, right: 4.0),
                      //EdgeInsets.symmetric(horizontal: 8.0),
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
                              onPressed: () => _selectGearAndMerchSubCategory(),
                            ),
                    ),
                  ),
                ),
              ],
              isScrollable: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, bottom: 5.0), //left: 38.0 //bottom: 15.0
            child: Row(
              children: [
                Text(
                  getTextFromSelectedTab(),
                  style: textStyle14FW400White, //textStyle14FW400WithPColour
                ),
                buildIcon(
                  icon: doubleArrowIcon,
                  color: Colors.black45,
                  size: 14.0,
                ),
                Text(
                  _getSelectedSubCat(),
                  style: textStyle14FW400White,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 50.0),
                IconButton(
                  onPressed: () {
                    if (_selectedIndex == 0) {
                      _flowerViewModel.chooseFlowerType();
                    } else if (_selectedIndex == 1) {
                      _cartridgeView.selectCartType();
                    } else if (_selectedIndex == 2) {
                      _edibleViewModel.chooseEdibleType();
                    } else if (_selectedIndex == 3) {
                      _extractViewModel.chooseExtractType();
                    } else {
                      _gearAndMerchViewModel.chooseGearMerchType();
                    }
                  },
                  icon: Icon(Icons.add_alert),
                  iconSize: 16.0,
                  //20.0,
                  color: Colors.black54,
                  //padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                FlowerView(selectedSubCat: selectedSubCat),
                CartridgeView(selectedSubCat: selectedSubCat),
                EdibleView(selectedSubCat: selectedSubCat),
                ExtractView(selectedSubCat: selectedSubCat),
                GearAndMerchView(selectedSubCat: selectedSubCat),
              ],
            ),
          ),
        ],
      ),
      //onModelReady: (model) => model.realtimeOperations(index: _selectedIndex),
    );
  }

/*@override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;*/
}
