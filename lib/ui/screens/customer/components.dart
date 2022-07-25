import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/ui/screens/customer/view_model.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';

import '../../../constants.dart';

/////////////////////////////EmptyBanner widget/////////////////////////////////
//used by d 3tiers classes
class EmptyBanner extends StatelessWidget {
  const EmptyBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColour,
      elevation: 1.0,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        height: 250.0, //333.0
        width: 383.0,
        alignment: Alignment.center,
        child: Text('Banner empty. Should be upload soon. Check back'),
      ),
    );
  }
}

/////////////////////////////EmptyArtwork widget/////////////////////////////////
//used by d 3tiers classes
class EmptyArtwork extends StatelessWidget {
  const EmptyArtwork({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
        child: Material(
          color: backgroundColour,
          elevation: 1.0,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            //margin: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 10.0),
            alignment: Alignment.center,
            height: 155.0,
            //width: 140.0,
            child: Text('No Artwork available for sale. Check back'),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////ArtworkCard widget/////////////////////////////////
//used by d 3tiers classes
class UserArtworkCard extends StatelessWidget {
  final Artwork artwork;
  final CustomerViewModel model;
  final String type;
  UserArtworkCard(
      {Key? key,
      required this.artwork,
      required this.model,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Material(
        color: backgroundColour,
        elevation: 1.0,
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: () => model.viewDetails(artwork, type),
          child: Container(
            //padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            //height: 155.0, //155.0
            //width: 140.0, //155.0
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                height: 150.0, //155.0
                width: 140.0,
                //height: 250.0, //333.0
                //width: 383.0,
                imageUrl: artwork.url!,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  if (downloadProgress.progress != null) {
                    final percent = (downloadProgress.progress! * 100).round();
                    return Text('$percent% done loading from database');
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

class ChooseArtwork extends StatelessWidget {
  final String imageURL;
  const ChooseArtwork({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 10.0),
      height: 155.0,
      width: 140.0, //155.0
      decoration: BoxDecoration(
        color: backgroundColour, //white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Image.asset(
        imageURL,
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

class TierImageContainer extends StatelessWidget {
  final String tierDesc;
  const TierImageContainer({
    Key? key,
    required this.tierDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
      child: Container(
        height: 333.0,
        width: 383.0,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  tierDesc,
                  style: textStyle22Bold,
                ),
                SizedBox(width: 50.0),
                Image.asset('lib/assets/cannabis_can.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

class TiersTabBar extends StatelessWidget {
  final TabController? _controller;
  const TiersTabBar({
    Key? key,
    TabController? controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _controller,
      padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 0.0),
      indicatorPadding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      unselectedLabelColor: greyDark,
      unselectedLabelStyle: textStyle14FW400DarkGrey,
      labelStyle: textStyle14FW400DarkGrey,
      labelColor: white,
      indicator: BoxDecoration(
        color: primaryColour,
        borderRadius: BorderRadius.circular(14.0),
      ),
      tabs: <Widget>[
        Tab(text: firstTierTxt),
        Tab(text: secondTierTxt),
        Tab(text: thirdTierTxt),
      ],
    );
  }
}

/*class TiersTabBar extends StatelessWidget {
  const TiersTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 0.0),
      indicatorPadding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      unselectedLabelColor: greyDark,
      unselectedLabelStyle: textStyle14FW400DarkGrey,
      labelStyle: textStyle14FW400DarkGrey,
      labelColor: white,
      indicator: BoxDecoration(
        color: primaryColour,
        borderRadius: BorderRadius.circular(14.0),
      ),
      tabs: <Widget>[
        Tab(text: '1st Tier'),
        Tab(text: '2nd Tier'),
        Tab(text: '3rd Tier'),
      ],
    );
  }
}*/

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

class ArtworkTabBarView extends StatelessWidget {
  const ArtworkTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TiersTabBar(),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 416.0, //90.0,
                  child: TabBarView(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TierImageContainer(
                              tierDesc: 'First Tier\nImage Here'),
                          Text(basicPkgTxt, style: textStyle16Bold),
                          Text(
                            whatYouGetTxt,
                            style: textStyle12Medium,
                          ),
                          Text(
                            '               -  An Artwork',
                            style: textStyle10Normal,
                          ),
                          Text(
                            '               -  One gift can of cannabis',
                            style: textStyle10Normal,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TierImageContainer(
                              tierDesc: 'Second Tier\nImage Here'),
                          Text(standPkgTxt, style: textStyle16Bold),
                          Text(
                            whatYouGetTxt,
                            style: textStyle12Medium,
                          ),
                          Text(
                            '               -  Medium Artwork',
                            style: textStyle10Normal,
                          ),
                          Text(
                            '               -  Two gift can of cannabis',
                            style: textStyle10Normal,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TierImageContainer(
                              tierDesc: 'Third Tier\nImage Here'),
                          Text(premPkgTxt, style: textStyle16Bold),
                          Text(
                            whatYouGetTxt,
                            style: textStyle12Medium,
                          ),
                          Text(
                            '               -  Large Artwork',
                            style: textStyle10Normal,
                          ),
                          Text(
                            '               -  Three gift can of cannabis',
                            style: textStyle10Normal,
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
                        choiceOfArtworkTxt,
                        style: textStyle16FW400,
                      ),
                    ),
                    SizedBox(width: 150.0),
                    customTextBtn(
                      onPressed: () => print('See All btn press'),
                      btnColour: greyDark,
                      btnTxt: seeAllTxt,
                      btnTextStyle: textStyle14FW400DarkGrey,
                    ),
                  ],
                ),
                SizedBox(
                  //height: MediaQuery.of(context).size.height,
                  height: 155.0,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ChooseArtwork(imageURL: 'lib/assets/guitar_artwork.png'),
                      ChooseArtwork(imageURL: 'lib/assets/mhg_bag_black.png'),
                      ChooseArtwork(imageURL: 'lib/assets/pet_image.png'),
                      ChooseArtwork(imageURL: 'lib/assets/jar_artwork.png'),
                      ChooseArtwork(
                          imageURL: 'lib/assets/mhg_bag_milk_colour.png'),
                      ChooseArtwork(imageURL: 'lib/assets/mug_artwork.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

class DeviceDetailsCard extends StatelessWidget {
  final String imageSource;
  final String deviceName;
  const DeviceDetailsCard({
    Key? key,
    required this.imageSource,
    required this.deviceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white, //Colors.brown,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 20.0,
              ),
              child: Center(
                child: Image.asset(
                  imageSource,
                  scale: 0.78, //0.9,
                ),
              ),
            ),
            Text(
              deviceName,
              style: textStyle11FW400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'USD 135',
                style: uploadEBTextStyle,
              ),
            ),
            Row(
              children: [
                buildIcon(
                  icon: Icons.star_rate,
                  color: yellow,
                  size: 16.0,
                ),
                Text(
                  review,
                  style: textStyle12Medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
