import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/retail/devices/edible/viewmodel.dart';
import 'package:stacked/stacked.dart';

class EdibleView extends StatefulWidget {
  final String selectedSubCat;

  const EdibleView({Key? key, required this.selectedSubCat}) : super(key: key);

  @override
  State<EdibleView> createState() => _EdibleViewState();
}

class _EdibleViewState extends State<EdibleView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EdibleViewModel>.reactive(
      viewModelBuilder: () => EdibleViewModel(),
      builder: (context, model, child) {
        if (widget.selectedSubCat == candyTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) => element.deviceType == Edibles.candy.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == chocolateTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where(
                      (element) => element.deviceType == Edibles.chocolate.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == bummieTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where(
                      (element) => element.deviceType == Edibles.bummies.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == honeyTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) => element.deviceType == Edibles.honey.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == cakeTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) => element.deviceType == Edibles.cake.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == drinkTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) => element.deviceType == Edibles.drink.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == cannabudderTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) =>
                      element.deviceType == Edibles.cannabudder.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == oilTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) => element.deviceType == Edibles.oils.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == capsuleTxt) {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where(
                      (element) => element.deviceType == Edibles.capsule.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          if (model.reactiveEdible != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveEdible!
                  .where((element) =>
                      element.deviceType == Edibles.edibleDistillate.name)
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
