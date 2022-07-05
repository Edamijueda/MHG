import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/devices/components.dart';
import 'package:mhg/ui/screens/admin/retail/devices/cartridge/viewmodel.dart';
import 'package:stacked/stacked.dart';

class CartridgeView extends StatefulWidget {
  final String selectedSubCat;

  const CartridgeView({Key? key, required this.selectedSubCat})
      : super(key: key);

  @override
  State<CartridgeView> createState() => _CartridgeViewState();
}

class _CartridgeViewState extends State<CartridgeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartridgeViewModel>.reactive(
      viewModelBuilder: () => CartridgeViewModel(),
      builder: (context, model, child) {
        if (widget.selectedSubCat == cbdCartTxt) {
          if (model.reactiveCartridge != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveCartridge!
                  .where((element) => element.deviceType == Carts.cbdCart.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (widget.selectedSubCat == delta8CartTxt) {
          if (model.reactiveCartridge != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveCartridge!
                  .where(
                      (element) => element.deviceType == Carts.delta8Cart.name)
                  .map((e) => DeviceCard(device: e, model: model))
                  .toList(),
            );
          } else {
            return SizedBox.shrink();
          }
        } else {
          if (model.reactiveCartridge != null) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 6.0,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              children: model.reactiveCartridge!
                  .where((element) => element.deviceType == Carts.thcCart.name)
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
