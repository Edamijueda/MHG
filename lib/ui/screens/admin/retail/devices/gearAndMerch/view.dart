import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/retail/devices/gearAndMerch/viewmodel.dart';
import 'package:stacked/stacked.dart';

class GearAndMerchView extends StatefulWidget {
  final String selectedSubCat;
  const GearAndMerchView({Key? key, required this.selectedSubCat})
      : super(key: key);

  @override
  State<GearAndMerchView> createState() => _GearAndMerchViewState();
}

class _GearAndMerchViewState extends State<GearAndMerchView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GearAndMerchViewModel>.reactive(
      viewModelBuilder: () => GearAndMerchViewModel(),
      builder: (context, model, child) {
        if (widget.selectedSubCat == artPrintAndDigitalTxt) {
          if (model.reactiveGearMerch != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveGearMerch!
                  .where((element) =>
                      element.deviceType ==
                      GearsAndMerch.artPrintAndDigital.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == tShirtTxt) {
          if (model.reactiveGearMerch != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveGearMerch!
                  .where((element) =>
                      element.deviceType == GearsAndMerch.tShirt.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == hoodiesTxt) {
          if (model.reactiveGearMerch != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveGearMerch!
                  .where((element) =>
                      element.deviceType == GearsAndMerch.hoodies.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == accessoriesTxt) {
          if (model.reactiveGearMerch != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveGearMerch!
                  .where((element) =>
                      element.deviceType == GearsAndMerch.accessories.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == socksTxt) {
          if (model.reactiveGearMerch != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveGearMerch!
                  .where((element) =>
                      element.deviceType == GearsAndMerch.socks.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          if (model.reactiveGearMerch != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveGearMerch!
                  .where((element) =>
                      element.deviceType == GearsAndMerch.rollingVaper.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        }
      },
      onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
