import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/help/help_view_model.dart';
import 'package:stacked/stacked.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HelpViewModel>.reactive(
      viewModelBuilder: () => HelpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child: Text('MHG help centre. Customers to reach out to us')),
      ),
    );
  }
}
