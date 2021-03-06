import 'package:flutter/material.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/core/enums/enums.dart';
import 'package:mhg/ui/setup/dialog/device/bong.dart';
import 'package:mhg/ui/setup/dialog/device/bubble.dart';
import 'package:mhg/ui/setup/dialog/device/dab_ring.dart';
import 'package:mhg/ui/setup/dialog/device/grinder.dart';
import 'package:mhg/ui/setup/dialog/device/pipe.dart';
import 'package:mhg/ui/setup/dialog/device/roller.dart';
import 'package:mhg/ui/setup/dialog/device/taster.dart';
import 'package:mhg/ui/setup/dialog/product/product_details_view.dart';
import 'package:mhg/ui/setup/dialog/product/product_entry_view.dart';
import 'package:mhg/ui/setup/dialog/retail/cartridge.dart';
import 'package:mhg/ui/setup/dialog/retail/edible.dart';
import 'package:mhg/ui/setup/dialog/retail/extract.dart';
import 'package:mhg/ui/setup/dialog/retail/flower.dart';
import 'package:mhg/ui/setup/dialog/retail/gear_merch.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUI() {
  final DialogService dialogService = locator<DialogService>();
  final builders = {
    DialogType.productEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        ProductEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.productDetails: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        ProductDetailsView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.pipeEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        PipeEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.grinderEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        GrinderEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.rollerEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        RollerEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.tasterEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        TasterEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.bongEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        BongEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.dabRingEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        DabRingEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.bubbleEntry: (BuildContext context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        BubbleEntryView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.chooseFlowerType: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        ChooseFlowerView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.chooseCartType: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        ChooseCartridgeView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.chooseEdibleType: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        ChooseEdibleView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.chooseExtractType: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        ChooseExtractView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.chooseGearAndMerchType: (BuildContext context,
            DialogRequest dialogRequest, Function(DialogResponse) completer) =>
        ChooseGearAndMerchView(
          request: dialogRequest,
          onDialogTap: completer,
        ),
  };
  dialogService.registerCustomDialogBuilders(builders);
}
