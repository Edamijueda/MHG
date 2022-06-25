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
  const Admin1stTierView({Key? key}) : super(key: key);

  @override
  State<Admin1stTierView> createState() => _Admin1stTierViewState();
}

class _Admin1stTierViewState extends State<Admin1stTierView> {
  final log = getStackedLogger('Admin1stTierView');

  Admin1stTierViewModel admin1stTierViewModel = Admin1stTierViewModel();

  /* List<Artwork?>?  addReactiveArtworkDataToList() {
    List<Artwork?> temp;
    if ((admin1stTierViewModel.reactiveArtworkData != null)) {
       temp = admin1stTierViewModel.listOfArtwork
          .add(admin1stTierViewModel.reactiveArtworkData);
    }
    return null;
  }*/

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Admin1stTierViewModel>.reactive(
      viewModelBuilder: () => Admin1stTierViewModel(),
      builder: (context, model, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
              child: Row(
                children: [
                  ImageSelectionContainer(model: model),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextBtn(
                        onPressed: () {
                          model.addImage(title: firstTierTxt);
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
                  onPressed: () => model.callAddArtwork(),
                  btnColour: greyDark,
                  btnTxt: addTxt,
                  btnTextStyle: textStyle14FW400DarkGrey,
                ),
              ],
            ),
            (model.reactiveListOfArtwork != null)
                ? SizedBox(
                    height: 190.0, //original value 155.0,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      scrollDirection: Axis.horizontal,
                      children: model.reactiveListOfArtwork!
                          .map((e) => _ArtworkCard(artwork: e, model: model))
                          .toList(),
                    ),
                  )
                : Container(
                    height: 155.0,
                    width: 155.0,
                    color: Colors.brown,
                  )
          ],
        ),
      ),
      onModelReady: (model) => model.callRealTimeOperations(),
      //createNewModelOnInsert: true,
    );
  }
}

class _ArtworkCard extends StatelessWidget {
  final Artwork? artwork;
  final Admin1stTierViewModel model;

  const _ArtworkCard({
    Key? key,
    required this.artwork,
    required this.model,
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
                        imageUrl: artwork?.artworkUrl ??
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
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildIconButton(
                    icon: Icon(Icons.info, color: Colors.black26),
                    onClickPrintOnConsole: 'info icon is clicked',
                    padding: EdgeInsets.all(8.0),
                  ),
                  buildIconButton(
                    icon: Icon(Icons.more_vert, color: Colors.black26),
                    onClickPrintOnConsole: 'more icon is clicked',
                    padding: EdgeInsets.all(8.0),
                  ),
                  buildIconButton(
                    icon: Icon(Icons.cancel, color: Colors.black26),
                    onClickPrintOnConsole: 'cancel icon is clicked',
                    padding: EdgeInsets.all(8.0),
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
/*Container(
            width: 220.0,
            height: 150.0,
            color: greyDark,
            alignment: Alignment.center,
            child: (model.artworkDataFromFirestore != null)
                ? CachedNetworkImage(
                    imageUrl: model.artworkDataFromFirestore?.artworkUrl ??
                        'shorturl.at/nprHV', // D else image ask u to see admin
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      if (downloadProgress.progress != null) {
                        final percent = downloadProgress.progress! * 100;
                        return Text('$percent% done loading from database');
                      }
                      return CircularProgressIndicator();
                    },
                  )
                : Text('Listener fail to fetch image'),
          ),*/ // this widget is used to test a quick idea on catchNetworkImage
/*Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              color: Colors.yellow,
              // Show busy for number future until the data is back or has failed
              child: model.hasError
                  ? CircularProgressIndicator()
                  : Text('I am confuse')//Text(model.fetchedNumber.toString()),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              color: Colors.red,
              // Show busy for string future until the data is back or has failed
              child: model.fetchingString
                  ? CircularProgressIndicator()
                  : Text(model.fetchedString),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              color: Colors.teal,
              // Show busy for string future until the data is back or has failed
              child: model.hasErrorForKey('delayedError')
                  ? Text(model.fetchedError.toString())
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),*/ // this widget is used to test FutureViewModel functionality
/*Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
            child: Row(
              children: [
                GestureDetector(
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
                    child: (((model.tryingAnApproach != null) ||
                                (model.bannerDataFromFirestore() != null)) &&
                            (model.selectedImage ==
                                null)) //model.tryingAnApproach != null && model.selectedImage == null
                        ? ((model.tryingAnApproach != null) &&
                                (model.bannerDataFromFirestore() == null))
                            ? CachedNetworkImage(
                                //model.bannerDataFromFirestore()?.bannerUrl
                                imageUrl: model.tryingAnApproach?.bannerUrl ??
                                    'https://previews.123rf.com/images/sebicla/sebicla1303/sebicla130300159/18458190-contact-admin.jpg',
                                // D else image ask u to see admin
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) {
                                  if (downloadProgress.progress != null) {
                                    final percent =
                                        (downloadProgress.progress! * 100)
                                            .round();
                                    return Text(
                                        '$percent% done loading from database');
                                  }
                                  //return Text('loading $url');
                                  return CircularProgressIndicator();
                                },
                              )
                            : CachedNetworkImage(
                                //model.bannerDataFromFirestore()?.bannerUrl
                                imageUrl: model
                                        .bannerDataFromFirestore()
                                        ?.bannerUrl ??
                                    'https://previews.123rf.com/images/sebicla/sebicla1303/sebicla130300159/18458190-contact-admin.jpg',
                                // D else image ask u to see admin
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) {
                                  if (downloadProgress.progress != null) {
                                    final percent =
                                        (downloadProgress.progress! * 100)
                                            .round();
                                    return Text(
                                        '$percent% done loading from database');
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
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextBtn(
                      onPressed: () {
                        model.addImage(title: firstTierTxt);
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
          ),*/ // this widget was used to test banner read write from firebase
/*(() {
                // your code here
                if (model.reactiveArtworkData != null ||
                    model.artworkDataFromStorage != null) {
                  if (model.reactiveArtworkData != null &&
                      model.artworkDataFromStorage == null) {
                    var length = model.addReactive(model.reactiveArtworkData);
                    log.i(
                        'after adding reactiveData, returned length is : $length');
                    log.i(
                        'after adding reactiveData, length from viewModel is: ${model.length}');
                    return ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        var artworkData = model.listOfArtwork[index];
                        return _ArtworkCard(
                          artwork: artworkData,
                          model: model,
                        );
                      },
                    );
                  } else {
                    var length =
                        model.addReactive(model.artworkDataFromStorage);
                    log.i(
                        'after adding artworkDataFromStorage, returned length is: $length');
                    log.i(
                        'after adding artworkDataFromStorage, length from viewModel is: ${model.length}');
                    return ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        var artworkData = model.listOfArtwork[index];
                        return _ArtworkCard(
                          artwork: artworkData,
                          model: model,
                        );
                      },
                    );
                  }
                } else {
                  return Container(
                    height: 155.0,
                    width: 155.0,
                    color: Colors.indigo,
                    child: Text('Default container return'),
                  );
                }
              }())*/ // this widget was used to test list of artwork
