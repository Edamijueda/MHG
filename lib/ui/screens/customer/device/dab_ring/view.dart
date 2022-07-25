import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/devices/dab_ring/view_model.dart';
import 'package:mhg/ui/screens/customer/device/view_model.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:stacked/stacked.dart';

class CDabRingView extends StatefulWidget {
  const CDabRingView({Key? key}) : super(key: key);

  @override
  State<CDabRingView> createState() => _CDabRingViewState();
}

class _CDabRingViewState extends State<CDabRingView> {
  @override
  Widget build(BuildContext context) {
    CustomerDeviceViewModel parentModel = CustomerDeviceViewModel();
    return ViewModelBuilder<DabRingViewModel>.reactive(
      viewModelBuilder: () => DabRingViewModel(),
      builder: (context, model, child) => Column(
        children: [
          (() {
            // your code here
            if (model.reactiveDabRing != null) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: model.reactiveDabRing!.map((element) {
                    element.deviceType = tabs[5].text!;
                    return DeviceCard(
                      device: element,
                      model: parentModel,
                      hasDelBtn: false,
                    );
                  }).toList(),
                ),
              );
            } else {
              return EmptyDevice(deviceType: tabs[5].text!);
            }
          }()),
        ],
      ),
      onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
