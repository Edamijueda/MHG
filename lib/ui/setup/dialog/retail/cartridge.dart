import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/retail/devices/cartridge/viewmodel.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseCartridgeView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ChooseCartridgeView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<ChooseCartridgeView> createState() => _ChooseCartridgeViewState();
}

class _ChooseCartridgeViewState extends State<ChooseCartridgeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartridgeViewModel>.reactive(
      viewModelBuilder: () => CartridgeViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: Container(
          width: 305.0,
          height: 250.0, // 500
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Choose cartridge type to upload'),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Carts.cbdCart.name);
                },
                child: Text(Carts.cbdCart.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Carts.delta8Cart.name);
                },
                child: Text(Carts.delta8Cart.name),
              ),
              TextButton(
                onPressed: () {
                  widget.onDialogTap(DialogResponse(confirmed: true));
                  model.addDevice(Carts.thcCart.name);
                },
                child: Text(Carts.thcCart.name),
              ),
            ],
          ), // rev height used 500.0
        ),
      ),
    );
  }
}
