import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/account_settings/account_settings_view_model.dart';
import 'package:stacked/stacked.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  _AccountSettingsViewState createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountSettingsViewModel>.reactive(
      viewModelBuilder: () => AccountSettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child: Text('For users to customize their account settings')),
      ),
    );
  }
}
