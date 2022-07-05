import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/retail/devices/gearAndMerch/viewmodel.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseGearAndMerchView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ChooseGearAndMerchView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<ChooseGearAndMerchView> createState() => _ChooseGearAndMerchViewState();
}

class _ChooseGearAndMerchViewState extends State<ChooseGearAndMerchView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GearAndMerchViewModel>.reactive(
      viewModelBuilder: () => GearAndMerchViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: Container(
          width: 305.0,
          height: 330.0, // 500
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Choose Gear/Merch type to upload'),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(GearsAndMerch.artPrintAndDigital.name);
                },
                child: Text(GearsAndMerch.artPrintAndDigital.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(GearsAndMerch.tShirt.name);
                },
                child: Text(GearsAndMerch.tShirt.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(GearsAndMerch.hoodies.name);
                },
                child: Text(GearsAndMerch.hoodies.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(GearsAndMerch.accessories.name);
                },
                child: Text(GearsAndMerch.accessories.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(GearsAndMerch.socks.name);
                },
                child: Text(GearsAndMerch.socks.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(GearsAndMerch.rollingVaper.name);
                },
                child: Text(GearsAndMerch.rollingVaper.name),
              ),
            ],
          ), // rev height used 500.0
        ),
      ),
    );
  }
}
