import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/devices/pipe/viewmodel.dart';
import 'package:stacked/stacked.dart';

class PipeView extends StatefulWidget {
  const PipeView({Key? key}) : super(key: key);

  @override
  State<PipeView> createState() => _PipeViewState();
}

class _PipeViewState extends State<PipeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PipeViewModel>.reactive(
      viewModelBuilder: () => PipeViewModel(),
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
            if (model.reactivePipe != null) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: model.reactivePipe!
                      .map((element) =>
                          DeviceCard(device: element, model: model))
                      .toList(),
                ),
              );
            } else {
              return Expanded(child: SizedBox.shrink());
            }
          }()),
        ],
      ),
      onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
