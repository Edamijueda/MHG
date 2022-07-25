import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/customer/components.dart';
import 'package:mhg/ui/screens/customer/tier1/view_model.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class CustomerTier1View extends StatefulWidget {
  const CustomerTier1View({Key? key}) : super(key: key);

  @override
  State<CustomerTier1View> createState() => _CustomerTier1ViewState();
}

class _CustomerTier1ViewState extends State<CustomerTier1View> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerTier1ViewModel>.reactive(
      viewModelBuilder: () => CustomerTier1ViewModel(),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
            child: (model.reactiveBanner == null)
                ? EmptyBanner()
                : Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      child: CachedNetworkImage(
                        //fit: BoxFit.fitHeight,
                        //height: 132.0,
                        height: 250.0, //333.0
                        width: 383.0,
                        imageUrl: model.reactiveBanner!.bannerUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          if (downloadProgress.progress != null) {
                            final percent =
                                (downloadProgress.progress! * 100).round();
                            return Text('$percent% done loading from database');
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
          ),
          Text(basicPkgTxt, style: textStyle16Bold),
          Text(
            whatYouGetTxt,
            style: textStyle13Medium,
          ),
          Text(
            '               -  An Artwork',
            style: textStyle11Normal,
          ),
          Text(
            '               -  One gift can of cannabis',
            style: textStyle11Normal,
          ),
          buildDivider(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 15.0),
            child: Text(
              choiceOfArtworkTxt,
              style: textStyle16FW400,
            ),
          ),
          (() {
            // your code here
            if (model.reactiveArtworks != null) {
              return Expanded(
                child: SizedBox(
                  //height: MediaQuery.of(context).size.height,
                  height: 155.0,
                  child: ListView(
                    padding:
                        EdgeInsets.only(left: 7.0, right: 7.0, bottom: 10.0),
                    scrollDirection: Axis.horizontal,
                    children: model.reactiveArtworks!
                        .map((element) => UserArtworkCard(
                              artwork: element,
                              model: model,
                              type: firstTierArtworkTxt,
                            ))
                        .toList(),
                  ),
                ),
              );
            } else {
              return EmptyArtwork();
            }
          }())
        ],
      ),
      onModelReady: (model) => model.callRealTimeOperations(),
    );
  }
}
