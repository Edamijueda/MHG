import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/retail/devices/flower/viewmodel.dart';
import 'package:stacked/stacked.dart';

class FlowerView extends StatefulWidget {
  final String selectedSubCat;

  const FlowerView({Key? key, required this.selectedSubCat}) : super(key: key);

  @override
  State<FlowerView> createState() => _FlowerViewState();
}

class _FlowerViewState extends State<FlowerView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FlowerViewModel>.reactive(
      viewModelBuilder: () => FlowerViewModel(),
      builder: (context, model, child) {
        if (widget.selectedSubCat == designFlowerTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where(
                      (element) => element.deviceType == Flowers.designers.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
              /*.map((element) => DeviceCard(device: element, model: model))
                  .toList(),*/
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == midGradeTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where(
                      (element) => element.deviceType == Flowers.midGrade.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == lightDepthPremiumTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where((element) =>
                      element.deviceType == Flowers.lightDepthPremium.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == lightDepthTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where((element) =>
                      element.deviceType == Flowers.lightDepth.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == affordableTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where((element) =>
                      element.deviceType == Flowers.affordable.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == shakeTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where((element) => element.deviceType == Flowers.shakes.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
              /*.map((element) => DeviceCard(device: element, model: model))
                  .toList(),*/
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == dcHarvestTxt) {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where(
                      (element) => element.deviceType == Flowers.dcHarvest.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          if (model.reactiveFlower != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveFlower!
                  .where(
                      (element) => element.deviceType == Flowers.organic.name)
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
