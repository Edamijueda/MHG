import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/bong/view_model.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:stacked/stacked.dart';

class CBongView extends StatefulWidget {
  const CBongView({Key? key}) : super(key: key);

  @override
  State<CBongView> createState() => _CBongViewState();
}

class _CBongViewState extends State<CBongView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BongViewModel>.reactive(
      viewModelBuilder: () => BongViewModel(),
      builder: (context, model, child) => Column(
        children: [
          (() {
            // your code here
            if (model.reactiveBong != null) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: model.reactiveBong!
                      .map((element) =>
                          DeviceCard(device: element, model: model))
                      .toList(),
                ),
              );
            } else {
              return EmptyDevice(deviceType: tabs[4].text!);
            }
          }()),
        ],
      ),
      //onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
