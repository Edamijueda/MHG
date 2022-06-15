import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_components.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_viewmodel.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';

class Admin1stTierView extends StatefulWidget {
  const Admin1stTierView({Key? key}) : super(key: key);

  @override
  State<Admin1stTierView> createState() => _Admin1stTierViewState();
}

class _Admin1stTierViewState extends State<Admin1stTierView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Admin1stTierViewModel>.reactive(
      viewModelBuilder: () => Admin1stTierViewModel(),
      builder: (context, model,
              child) => /*Center(
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
      ),*/
          Column(
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
          //buildDivider(),
          /*Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(
                    left: 10.0),
                child: Text(
                  manageArtworkTxt,
                  style: textStyle16FW400,
                ),
              ),
              SizedBox(width: 185.0),
              customTextBtn(
                onPressed: () =>
                    model.callAddArtwork(),
                btnColour: greyDark,
                btnTxt: addTxt,
                btnTextStyle:
                textStyle14FW400DarkGrey,
              ),
            ],
          ),*/
          /*SizedBox(
                                                //height: MediaQuery.of(context).size.height,
                                                height: 155.0,
                                                child: ListView(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: <Widget>[
                                                    ChooseArtwork(
                                                        imageURL:
                                                            'lib/assets/guitar_artwork.png'),
                                                    ChooseArtwork(
                                                        imageURL:
                                                            'lib/assets/mhg_bag_black.png'),
                                                    ChooseArtwork(
                                                        imageURL:
                                                            'lib/assets/pet_image.png'),
                                                    ChooseArtwork(
                                                        imageURL:
                                                            'lib/assets/jar_artwork.png'),
                                                    ChooseArtwork(
                                                        imageURL:
                                                            'lib/assets/mhg_bag_milk_colour.png'),
                                                    ChooseArtwork(
                                                        imageURL:
                                                            'lib/assets/mug_artwork.png'),
                                                  ],
                                                ),
                                              ),*/
          /*Expanded(
            child: Container(
              //color: Colors.red,
              height: 80.0,
              child: model.,
            ),
          ),*/
        ],
      ),
      onModelReady: (model) => model.callRealTimeOperations(),
    );
  }
}
/*Container(
            width: 220.0,
            height: 150.0,
            color: greyDark,
            alignment: Alignment.center,
            child: (model.bannerDataFromFirestore1 != null)
                ? CachedNetworkImage(
                    imageUrl: model.bannerDataFromFirestore1?.bannerUrl ??
                        'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/F/I/87738_1522353069.jpg',
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      if (downloadProgress.progress != null) {
                        final percent = downloadProgress.progress! * 100;
                        return Text('$percent% done loading from database');
                      }
                      return Text('loading $url');
                    },
                  )
                : Text('Listener fail to fetch image'),
          ),*/ // this widget is used to test a quick idea
