import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/admin/devices/bubbler/view_model.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:stacked/stacked.dart';

class BubbleView extends StatefulWidget {
  const BubbleView({Key? key}) : super(key: key);

  @override
  State<BubbleView> createState() => _BubbleViewState();
}

class _BubbleViewState extends State<BubbleView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BubbleViewModel>.reactive(
      viewModelBuilder: () => BubbleViewModel(),
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
            if (model.reactiveBubble != null) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: model.reactiveBubble!
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
