import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/retail/devices/edible/viewmodel.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseEdibleView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ChooseEdibleView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<ChooseEdibleView> createState() => _ChooseEdibleViewState();
}

class _ChooseEdibleViewState extends State<ChooseEdibleView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EdibleViewModel>.reactive(
      viewModelBuilder: () => EdibleViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: SingleChildScrollView(
          child: Container(
            width: 305.0,
            height: 525.0, // 500
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text('Choose Edible type to upload'),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.candy.name);
                  },
                  child: Text(Edibles.candy.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.chocolate.name);
                  },
                  child: Text(Edibles.chocolate.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.bummies.name);
                  },
                  child: Text(Edibles.bummies.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.honey.name);
                  },
                  child: Text(Edibles.honey.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.cake.name);
                  },
                  child: Text(Edibles.cake.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.drink.name);
                  },
                  child: Text(Edibles.drink.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.cannabudder.name);
                  },
                  child: Text(Edibles.cannabudder.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.oils.name);
                  },
                  child: Text(Edibles.oils.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.capsule.name);
                  },
                  child: Text(Edibles.capsule.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Edibles.edibleDistillate.name);
                  },
                  child: Text(Edibles.edibleDistillate.name),
                ),
              ],
            ), // rev height used 500.0
          ),
        ),
      ),
    );
  }
}
