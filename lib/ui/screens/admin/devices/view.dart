import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/bong/view.dart';
import 'package:mhg/ui/screens/admin/devices/bubbler/view.dart';
import 'package:mhg/ui/screens/admin/devices/dab_ring/view.dart';
import 'package:mhg/ui/screens/admin/devices/grinder/view.dart';
import 'package:mhg/ui/screens/admin/devices/pipe/view.dart';
import 'package:mhg/ui/screens/admin/devices/roller/view.dart';
import 'package:mhg/ui/screens/admin/devices/taster/view.dart';
import 'package:mhg/ui/screens/admin/devices/view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class AdminDeviceView extends StatefulWidget {
  const AdminDeviceView({Key? key}) : super(key: key);

  @override
  State<AdminDeviceView> createState() => _AdminDeviceViewState();
}

class _AdminDeviceViewState extends State<AdminDeviceView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminDeviceViewModel>.reactive(
      viewModelBuilder: () => AdminDeviceViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TabBar(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0, //10.0
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
                  PipeView(),
                  GrinderView(),
                  RollerView(),
                  TasterView(),
                  BongView(),
                  DabRingView(),
                  BubbleView(),
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
