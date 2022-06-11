import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_viewmodel.dart';
import 'package:mhg/ui/theme/typography.dart';

class ImageSelectionContainer extends StatelessWidget {
  final Admin1stTierViewModel model;

  const ImageSelectionContainer({
    Key? key,
    required this.model,
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
        child: (model.bannerDataFromFirestore != null)
            ? CachedNetworkImage(
                imageUrl: model.bannerDataFromFirestore?.bannerUrl ??
                    'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/F/I/87738_1522353069.jpg',
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  if (downloadProgress.progress != null) {
                    final percent = downloadProgress.progress! * 100;
                    return Text('$percent% done loading from database');
                  }
                  return Text('loading $url');
                },
              )
            : (model.selectedImage == null)
                ? Text(
                    tapToAddTxt,
                    style: textStyle14FW400DarkGrey,
                    //textAlign: TextAlign.center,
                  )
                : Image.file(File(model.selectedImage!.path)),
        /*child: (model.selectedImage == null)
            ? Text(
                tapToAddTxt,
                style: textStyle14FW400DarkGrey,
                //textAlign: TextAlign.center,
              )
            : CachedNetworkImage(
          imageUrl: model.bannerDataFromFirestore.bannerUrl ?? 'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/F/I/87738_1522353069.jpg',
          progressIndicatorBuilder: (context, url, downloadProgress) {
            if (downloadProgress.progress != null) {
              final percent = downloadProgress.progress! * 100;
              return Text('$percent% done loading from database');
            }
            return Text('loading $url');
          },
        ),*/ /*(model.bannerDataFromFirestore == null)
                ? Image.file(File(model.selectedImage!.path))
                : CachedNetworkImage(
                    imageUrl: model.bannerDataFromFirestore!.bannerUrl,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      if (downloadProgress.progress != null) {
                        final percent = downloadProgress.progress! * 100;
                        return Text('$percent% done loading from database');
                      }
                      return Text('loading $url');
                    },
                  ),*/
      ),
    );
  }
}