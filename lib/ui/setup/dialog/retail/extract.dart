import 'package:flutter/material.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/screens/admin/retail/devices/extract/viewmodel.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseExtractView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ChooseExtractView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<ChooseExtractView> createState() => _ChooseExtractViewState();
}

class _ChooseExtractViewState extends State<ChooseExtractView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExtractViewModel>.reactive(
      viewModelBuilder: () => ExtractViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: SingleChildScrollView(
          child: Container(
            width: 305.0,
            height: 520.0, // 500
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text('Choose Extract type to upload'),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.shatter.name);
                  },
                  child: Text(Extracts.shatter.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.hash.name);
                  },
                  child: Text(Extracts.hash.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.wax.name);
                  },
                  child: Text(Extracts.wax.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.kief.name);
                  },
                  child: Text(Extracts.kief.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.diamond.name);
                  },
                  child: Text(Extracts.diamond.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.crumble.name);
                  },
                  child: Text(Extracts.crumble.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.budder.name);
                  },
                  child: Text(Extracts.budder.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.preRoll.name);
                  },
                  child: Text(Extracts.preRoll.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.moonRock.name);
                  },
                  child: Text(Extracts.moonRock.name),
                ),
                TextButton(
                  onPressed: () {
                    widget.onDialogTap(DialogResponse(confirmed: true));
                    model.addDevice(Extracts.extractDistillate.name);
                  },
                  child: Text(Extracts.extractDistillate.name),
                ),
              ],
            ), // rev height used 500.0
          ),
        ),
      ),
    );
  }
}
