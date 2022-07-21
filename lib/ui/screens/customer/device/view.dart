import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/customer/device/bong/view.dart';
import 'package:mhg/ui/screens/customer/device/bubbler/view.dart';
import 'package:mhg/ui/screens/customer/device/dab_ring/view.dart';
import 'package:mhg/ui/screens/customer/device/grinder/view.dart';
import 'package:mhg/ui/screens/customer/device/pipe/view.dart';
import 'package:mhg/ui/screens/customer/device/roller/view.dart';
import 'package:mhg/ui/screens/customer/device/taster/view.dart';
import 'package:mhg/ui/screens/customer/device/view_model.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class CustomerDeviceView extends StatefulWidget {
  const CustomerDeviceView({Key? key}) : super(key: key);

  @override
  State<CustomerDeviceView> createState() => _CustomerDeviceViewState();
}

class _CustomerDeviceViewState extends State<CustomerDeviceView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDeviceViewModel>.reactive(
      viewModelBuilder: () => CustomerDeviceViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            buildCustomTextField(
              sizeOfTF: sizeW326H30,
              tfPadding: EdgeInsets.only(top: 15.0, bottom: 5.0), // 25/15
              hintTS: TextStyle(
                fontSize: 12.0,
                color: grey,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.2,
              ),
              hintText: searchItemHintTxt,
              prefixIcon: buildIcon(icon: searchIcon, color: grey, size: 20.0),
              inputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: grey), //greyDark //grey
                borderRadius: borderRadius10,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 7.0),
              child: TabBar(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0,
                ),
                labelPadding: const EdgeInsets.only(left: 25.0, right: 25.0),
                unselectedLabelColor: greyDark,
                unselectedLabelStyle: textStyle14FW400DarkGrey,
                labelStyle: textStyle14FW400DarkGrey,
                labelColor: white,
                indicator: BoxDecoration(
                  color: primaryColour,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                tabs: tabs,
                isScrollable: true,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  CPipeView(),
                  CGrinderView(),
                  CRollerView(),
                  CTasterView(),
                  CBongView(),
                  CDabRingView(),
                  CBubbleView(),
                ],
              ),
            ),
          ],
        ),
      ),
      /*onModelReady: (model) => model.callRealTimeOperations(
        docId: widget.tierType,
        path: widget.artworkType,
      ),*/
    );
  }
}
