import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/admin/devices/bong/view_model.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:stacked/stacked.dart';

class BongView extends StatefulWidget {
  const BongView({Key? key}) : super(key: key);

  @override
  State<BongView> createState() => _BongViewState();
}

class _BongViewState extends State<BongView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BongViewModel>.reactive(
      viewModelBuilder: () => BongViewModel(),
      builder: (context, model, child) => Column(
        children: [
          IconButton(
              onPressed: () => model.addDevice(),
              icon: Icon(Icons.add_alert),
              iconSize: 20.0,
              color: Colors.black54,
              padding: const EdgeInsets.only(top: 0.0, bottom: 0.0)),
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
              return SizedBox.shrink();
            }
          }()),
        ],
      ),
      onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
