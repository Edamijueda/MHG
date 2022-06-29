import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_components.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_viewmodel.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class Admin1stTierView extends StatefulWidget {
  final String tierType;
  final String artworkType;

  const Admin1stTierView({
    Key? key,
    required this.tierType,
    required this.artworkType,
  }) : super(key: key);

  @override
  State<Admin1stTierView> createState() => _Admin1stTierViewState();
}

class _Admin1stTierViewState extends State<Admin1stTierView> {
  final log = getStackedLogger('Admin1stTierView');

  Admin1stTierViewModel admin1stTierViewModel = Admin1stTierViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Admin1stTierViewModel>.reactive(
      viewModelBuilder: () => Admin1stTierViewModel(),
      builder: (context, model, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              //prev used top:16, bottom:8, use new value to use column space
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 16.0),
              child: Row(
                children: [
                  ImageSelectionContainer(model: model),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextBtn(
                        onPressed: () {
                          model.addImage(title: widget.tierType);
                        },
                        btnColour: pVariantColour,
                        btnTxt: saveBannerTxt,
                        btnTextStyle: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    manageArtworkTxt,
                    style: textStyle16FW400,
                  ),
                ),
                SizedBox(width: 185.0),
                customTextBtn(
                  onPressed: () =>
                      model.callAddArtwork(artworkType: widget.artworkType),
                  btnColour: greyDark,
                  btnTxt: addTxt,
                  btnTextStyle: textStyle14FW400DarkGrey,
                ),
              ],
            ),
            SizedBox(height: 10.0), // to give height spacing
            (() {
              // your code here
              if (widget.artworkType == firstTierArtworkTxt) {
                if (model.reactiveListOfArtwork != null) {
                  return SizedBox(
                    height: 190.0, //original value 155.0,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      scrollDirection: Axis.horizontal,
                      children: model.reactiveListOfArtwork!
                          .map((e) => _ArtworkCard(
                                artwork: e,
                                model: model,
                                artworkType: widget.artworkType,
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              } else if (widget.artworkType == secondTierArtworkTxt) {
                if (model.secTierReactiveListOfArtwork != null) {
                  return SizedBox(
                    height: 190.0, //original value 155.0,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      scrollDirection: Axis.horizontal,
                      children: model.secTierReactiveListOfArtwork!
                          .map((e) => _ArtworkCard(
                                artwork: e,
                                model: model,
                                artworkType: widget.artworkType,
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              } else {
                if (model.thirdTierReactiveListOfArtwork != null) {
                  return SizedBox(
                    height: 190.0, //original value 155.0,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      scrollDirection: Axis.horizontal,
                      children: model.thirdTierReactiveListOfArtwork!
                          .map((e) => _ArtworkCard(
                                artwork: e,
                                model: model,
                                artworkType: widget.artworkType,
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              }
            }())
          ],
        ),
      ),
      onModelReady: (model) => model.callRealTimeOperations(
        docId: widget.tierType,
        path: widget.artworkType,
      ),
    );
  }
}

class _ArtworkCard extends StatelessWidget {
  final Artwork? artwork;
  final Admin1stTierViewModel model;
  final String artworkType;

  const _ArtworkCard({
    Key? key,
    required this.artwork,
    required this.model,
    required this.artworkType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 2.0,
      child: Container(
        height: 155.0,
        width: 155.0,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 3.0),
                child: (artwork !=
                        null) //model.artworkDataFromFirestore != null
                    ? CachedNetworkImage(
                        //fit: BoxFit.fitHeight,
                        //height: 115.0,
                        imageUrl: artwork?.url ??
                            'https://previews.123rf.com/images/sebicla/sebicla1303/sebicla130300159/18458190-contact-admin.jpg',
                        // D else image ask u to see admin
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          if (downloadProgress.progress != null) {
                            final percent =
                                (downloadProgress.progress! * 100).round();
                            return Text('$percent% done loading from database');
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      )
                    : Text('Listener fail to fetch image'),
              ),
            ),
            Container(
              height: 32.0,
              decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.black26),
                    onPressed: () => model.viewProductDetails(artwork),
                  ),
                  // Edit artwork feature is pending
                  /*IconButton(
                    icon: Icon(Icons.edit, color: Colors.black26),
                    onPressed: () => print(''),
                  ),*/
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.black26),
                    onPressed: () => model.deleteArtwork(
                        artwork: artwork, collectionPath: artworkType),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
