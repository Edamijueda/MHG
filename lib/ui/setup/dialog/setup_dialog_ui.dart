import 'package:flutter/material.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/core/enums/dialog_type.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_components.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_view_model.dart';
import 'package:mhg/ui/setup/dialog/product/product_entry_view.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUI() {
  final DialogService dialogService = locator<DialogService>();
  final builders = {
    DialogType.productEntry: (BuildContext context, DialogRequest dialogRequest,
        Function(DialogResponse) completer) =>
        ProductEntryView(request: dialogRequest, onDialogTap: completer,),
  };
  dialogService.registerCustomDialogBuilders(builders);
}