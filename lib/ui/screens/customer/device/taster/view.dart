import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/devices/taster/view_model.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:stacked/stacked.dart';

class CTasterView extends StatefulWidget {
  const CTasterView({Key? key}) : super(key: key);

  @override
  State<CTasterView> createState() => _CTasterViewState();
}

class _CTasterViewState extends State<CTasterView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TasterViewModel>.reactive(
      viewModelBuilder: () => TasterViewModel(),
      builder: (context, model, child) => Column(
        children: [
          (() {
            // your code here
            if (model.reactiveTaster != null) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: model.reactiveTaster!
                      .map((element) =>
                          DeviceCard(device: element, model: model))
                      .toList(),
                ),
              );
            } else {
              return EmptyDevice(deviceType: tabs[3].text!);
            }
          }()),
        ],
      ),
      //onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
