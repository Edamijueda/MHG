

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/screens/admin/admin_home_view_model.dart';
import 'package:mhg/ui/theme/typography.dart';

class ImageSelectionContainer extends StatelessWidget {
  final MhgBaseViewModel model;
  const ImageSelectionContainer({
    Key? key, required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        model.selectImage();
      },
      child: Container(
        width: 220.0,
        height: 150.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: borderRadius10,
        ),
        child: (model.selectedImage == null) ? Text(
          tapToAddTxt,
          style:
          textStyle14FW400DarkGrey,
          //textAlign: TextAlign.center,
        ) : Image.file(File(model.selectedImage!.path)),
      ),
    );
  }
}