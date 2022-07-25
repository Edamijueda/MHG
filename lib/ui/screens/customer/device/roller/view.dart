import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/devices/roller/view_model.dart';
import 'package:mhg/ui/screens/customer/device/view_model.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:stacked/stacked.dart';

class CRollerView extends StatefulWidget {
  const CRollerView({Key? key}) : super(key: key);

  @override
  State<CRollerView> createState() => _CRollerViewState();
}

class _CRollerViewState extends State<CRollerView> {
  @override
  Widget build(BuildContext context) {
    CustomerDeviceViewModel parentModel = CustomerDeviceViewModel();
    return ViewModelBuilder<RollerViewModel>.reactive(
      viewModelBuilder: () => RollerViewModel(),
      builder: (context, model, child) => Column(
        children: [
          (() {
            // your code here
            if (model.reactiveRoller != null) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: model.reactiveRoller!.map((element) {
                    element.deviceType = tabs[2].text!;
                    return DeviceCard(
                        device: element, model: parentModel, hasDelBtn: false);
                  }).toList(),
                ),
              );
            } else {
              return EmptyDevice(deviceType: tabs[2].text!);
            }
          }()),
        ],
      ),
      onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
