import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/retail/devices/flower/viewmodel.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseFlowerView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ChooseFlowerView(
      {Key? key, required this.request, required this.onDialogTap})
      : super(key: key);

  @override
  State<ChooseFlowerView> createState() => _ChooseFlowerViewState();
}

class _ChooseFlowerViewState extends State<ChooseFlowerView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FlowerViewModel>.reactive(
      viewModelBuilder: () => FlowerViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: Container(
          width: 305.0,
          height: 420.0, // 500
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Choose flower type to upload'),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.designers.name);
                },
                child: Text(Flowers.designers.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.midGrade.name);
                },
                child: Text(Flowers.midGrade.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.lightDepthPremium.name);
                },
                child: Text(Flowers.lightDepthPremium.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.lightDepth.name);
                },
                child: Text(Flowers.lightDepth.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.affordable.name);
                },
                child: Text(Flowers.affordable.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.shakes.name);
                },
                child: Text(Flowers.shakes.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.dcHarvest.name);
                },
                child: Text(Flowers.dcHarvest.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Flowers.organic.name);
                },
                child: Text(Flowers.organic.name),
              ),
            ],
          ), // rev height used 500.0
        ),
      ),
    );
  }
}
