import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/retail/devices/extract/viewmodel.dart';
import 'package:stacked/stacked.dart';

class ExtractView extends StatefulWidget {
  final String selectedSubCat;
  const ExtractView({Key? key, required this.selectedSubCat}) : super(key: key);

  @override
  State<ExtractView> createState() => _ExtractViewState();
}

class _ExtractViewState extends State<ExtractView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExtractViewModel>.reactive(
      viewModelBuilder: () => ExtractViewModel(),
      builder: (context, model, child) {
        if (widget.selectedSubCat == shatterTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where(
                      (element) => element.deviceType == Extracts.shatter.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == hashTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where((element) => element.deviceType == Extracts.hash.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == waxTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where((element) => element.deviceType == Extracts.wax.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == kiefTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where((element) => element.deviceType == Extracts.kief.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == diamondTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where(
                      (element) => element.deviceType == Extracts.diamond.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == crumblesTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where(
                      (element) => element.deviceType == Extracts.crumble.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == budderTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where(
                      (element) => element.deviceType == Extracts.budder.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == preRollTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where(
                      (element) => element.deviceType == Extracts.preRoll.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == moonRockTxt) {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where(
                      (element) => element.deviceType == Extracts.moonRock.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          if (model.reactiveExtract != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveExtract!
                  .where((element) =>
                      element.deviceType == Extracts.extractDistillate.name)
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
