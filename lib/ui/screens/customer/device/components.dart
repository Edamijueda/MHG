/*class DeviceTabBarView extends StatelessWidget {
  const DeviceTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}*/
