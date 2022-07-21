import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/customer/device/pipe/viewmodel.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:stacked/stacked.dart';

class CPipeView extends StatefulWidget {
  const CPipeView({Key? key}) : super(key: key);

  @override
  State<CPipeView> createState() => _CPipeViewState();
}

class _CPipeViewState extends State<CPipeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CPipeViewModel>.reactive(
      viewModelBuilder: () => CPipeViewModel(),
      builder: (context, model, child) => Column(
        children: [
          (() {
            // your code here
            if (model.reactivePipe != null) {
              return GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                //0.7, //(1 / 2)
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 6.0,
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                children: model.reactivePipe!
                    .map((element) => DeviceCard(device: element, model: model))
                    .toList(),
              );
            } else {
              return EmptyDevice(deviceType: tabs[0].text!);
            }
          }()),
        ],
      ),
      //onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
