import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';

import '../../../constants.dart';

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
      width: 155.0,
      decoration: BoxDecoration(
        color: white,
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

class DeviceTabBarView extends StatelessWidget {
  const DeviceTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*List<Tab> tabs = [
      Tab(text: 'Pipes'),
      Tab(text: 'Grinders'),
      Tab(text: 'Rollers'),
      Tab(text: 'Tasters'),
      Tab(text: 'Bongs'),
      Tab(text: 'Dab Rings'),
      Tab(text: 'Bubblers'),
    ];*/
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: <Widget>[
          buildCustomTextField(
            sizeOfTF: sizeW326H30,
            tfPadding: EdgeInsets.only(top: 15.0, bottom: 5.0), // 25/15
            hintTS: TextStyle(
              fontSize: 12.0,
              color: grey,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.2,
            ),
            hintText: searchItemHintTxt,
            prefixIcon: buildIcon(icon: searchIcon, color: grey, size: 20.0),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 7.0),
            child: TabBar(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10.0,
              ),
              labelPadding: const EdgeInsets.only(left: 25.0, right: 25.0),
              unselectedLabelColor: greyDark,
              unselectedLabelStyle: textStyle14FW400DarkGrey,
              labelStyle: textStyle14FW400DarkGrey,
              labelColor: white,
              indicator: BoxDecoration(
                color: primaryColour,
                borderRadius: BorderRadius.circular(14.0),
              ),
              tabs: tabs,
              isScrollable: true,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.6, //0.7, //(1 / 2)
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 6.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  children: <Widget>[
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/electric_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/stash_jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/mill_and_fill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/dab_ring.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/herb_grinder.png',
                      deviceName: herbGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill_fill_grinder.png',
                      deviceName: ottoMillFillGrinderTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/rok_dab_rig.png',
                      deviceName: electricDabRigTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/otto_mill.png',
                      deviceName: ottoMillAndFillTxt,
                    ),
                    DeviceDetailsCard(
                      imageSource: 'lib/assets/jar.png',
                      deviceName: herbGrinderTxt,
                    ),
                  ],
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
