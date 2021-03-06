import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
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
        //(model.bannerDataFromFirestore() != null)
        child: (((model.reactiveBannerData != null) ||
                    (model.bannerDataFromStorage != null)) &&
                (model.selectedImage ==
                    null)) //model.tryingAnApproach != null && model.selectedImage == null
            ? ((model.reactiveBannerData != null) &&
                    (model.bannerDataFromStorage == null))
                ? CachedNetworkImage(
                    //model.bannerDataFromFirestore()?.bannerUrl
                    imageUrl: model.reactiveBannerData?.bannerUrl ??
                        'https://previews.123rf.com/images/sebicla/sebicla1303/sebicla130300159/18458190-contact-admin.jpg',
                    // D else image ask u to see admin
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      if (downloadProgress.progress != null) {
                        final percent =
                            (downloadProgress.progress! * 100).round();
                        return Text('$percent% done loading from database');
                      }
                      //return Text('loading $url');
                      return CircularProgressIndicator();
                    },
                  )
                : CachedNetworkImage(
                    //model.bannerDataFromFirestore()?.bannerUrl
                    imageUrl: model.bannerDataFromStorage?.bannerUrl ??
                        'https://previews.123rf.com/images/sebicla/sebicla1303/sebicla130300159/18458190-contact-admin.jpg',
                    // D else image ask u to see admin
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      if (downloadProgress.progress != null) {
                        final percent =
                            (downloadProgress.progress! * 100).round();
                        return Text('$percent% done loading from database');
                      }
                      //return Text('loading $url');
                      return CircularProgressIndicator();
                    },
                  )
            : (model.selectedImage == null)
                ? Text(
                    tapToAddTxt,
                    style: textStyle14FW400DarkGrey,
                    //textAlign: TextAlign.center,
                  )
                : Image.file(File(model.selectedImage!.path)),
      ),
    );
  }
}
