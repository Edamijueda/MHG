import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_view_model.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_view.dart';
import 'package:mhg/ui/screens/customer_home/customer_home_components.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView>
    with SingleTickerProviderStateMixin {
  //final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();

  static int _selectedTierIndex = 0;

  late final TabController _tiersTabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    //_controller = TabController(length: tabs.length, vsync: this);

    _tiersTabController.addListener(() {
      setState(() {
        _selectedTierIndex = _tiersTabController.index;
      });
      print("Selected Index: " + _tiersTabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHomeViewModel>.reactive(
      disposeViewModel: false,
      // Tells the viewModelBuilder that we only want to initialise the SVM once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => AdminHomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColour,
        //Colors.tealAccent,//backgroundColour,
        body: getViewForIndex(model.currentIndex, model),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Upload',
              icon: Icon(Icons.upload_file),
            ),
            BottomNavigationBarItem(
              label: 'Alert',
              icon: Icon(Icons.info_outline),
            ),
            BottomNavigationBarItem(
              label: 'Sold',
              icon: Icon(Icons.add_task_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Stat',
              icon: Icon(Icons.insert_chart_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget getViewForIndex(int index, AdminHomeViewModel model) {
    switch (index) {
      case 0:
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5.0),
                color: pVariantColour, //Colors.teal.shade800,
                child: build2ColumnTabBar(
                  text4column1: customer,
                  text4column2: retailer,
                  textStyle: textStyleWhiteBold16,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            color: white,
                            child: build2ColumnTabBar(
                              text4column1: artworkTxt,
                              text4column2: deviceTxt,
                              textStyle: textStyleBlackBold16,
                              provideIndicatorSize: TabBarIndicatorSize.label,
                              indicatorDeco: const UnderlineTabIndicator(
                                borderSide: BorderSide(color: teal),
                                insets:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    TiersTabBar(
                                        controller: _tiersTabController),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _tiersTabController,
                                        children: [
                                          Admin1stTierView(),
                                          // Column(
                                          //   children: [
                                          //     Padding(
                                          //       padding:
                                          //           const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                                          //       child: Row(
                                          //         children: [
                                          //           ImageSelectionContainer(
                                          //               model: model),
                                          //           Column(
                                          //             crossAxisAlignment:
                                          //                 CrossAxisAlignment
                                          //                     .start,
                                          //             children: [
                                          //               customTextBtn(
                                          //                 onPressed: () {
                                          //                   model.addImage(
                                          //                       title:
                                          //                           firstTierTxt);
                                          //                 },
                                          //                 btnColour:
                                          //                     pVariantColour,
                                          //                 btnTxt: saveBannerTxt,
                                          //                 btnTextStyle:
                                          //                     TextStyle(
                                          //                   decoration:
                                          //                       TextDecoration
                                          //                           .underline,
                                          //                 ),
                                          //               ),
                                          //             ],
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //     buildDivider(),
                                          //     Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.center,
                                          //       children: <Widget>[
                                          //         Padding(
                                          //           padding:
                                          //               const EdgeInsets.only(
                                          //                   left: 10.0),
                                          //           child: Text(
                                          //             manageArtworkTxt,
                                          //             style: textStyle16FW400,
                                          //           ),
                                          //         ),
                                          //         SizedBox(width: 185.0),
                                          //         customTextBtn(
                                          //           onPressed: () =>
                                          //               model.callAddArtwork(),
                                          //           btnColour: greyDark,
                                          //           btnTxt: addTxt,
                                          //           btnTextStyle:
                                          //               textStyle14FW400DarkGrey,
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     /*SizedBox(
                                          //       //height: MediaQuery.of(context).size.height,
                                          //       height: 155.0,
                                          //       child: ListView(
                                          //         padding: EdgeInsets.symmetric(
                                          //             horizontal: 10.0),
                                          //         scrollDirection:
                                          //             Axis.horizontal,
                                          //         children: <Widget>[
                                          //           ChooseArtwork(
                                          //               imageURL:
                                          //                   'lib/assets/guitar_artwork.png'),
                                          //           ChooseArtwork(
                                          //               imageURL:
                                          //                   'lib/assets/mhg_bag_black.png'),
                                          //           ChooseArtwork(
                                          //               imageURL:
                                          //                   'lib/assets/pet_image.png'),
                                          //           ChooseArtwork(
                                          //               imageURL:
                                          //                   'lib/assets/jar_artwork.png'),
                                          //           ChooseArtwork(
                                          //               imageURL:
                                          //                   'lib/assets/mhg_bag_milk_colour.png'),
                                          //           ChooseArtwork(
                                          //               imageURL:
                                          //                   'lib/assets/mug_artwork.png'),
                                          //         ],
                                          //       ),
                                          //     ),*/
                                          //     Expanded(
                                          //       child: Container(
                                          //         //color: Colors.red,
                                          //         height: 80.0,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          Container(
                                            color: Colors.tealAccent,
                                          ),
                                          Container(
                                            color: Colors.teal.shade900,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  // width: 250.0,
                                  // height: 250.0,
                                  color: Colors.tealAccent,
                                ),
                                // ArtworkTabBarView(),
                                // DeviceTabBarView(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // width: 250.0,
                      // height: 250.0,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ); //UploadView();
      case 1:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.pink,
        ); //AlartView();
      case 2:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.blueGrey,
        ); //SoldItemsView();
      case 3:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.indigo,
        ); //StatView();
      default:
        return Container(
          width: 250.0,
          height: 250.0,
          color: Colors.brown,
        ); //UploadView();
    }
  }
}

/*class ImageSelectionContainer extends StatelessWidget {
  final AdminHomeViewModel model;
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
        color: Colors.white70,
        alignment: Alignment.center,
        */ /*child: Builder(
            builder: (context) {
              if(model.selectedImage != null){
                return Image.file(File(model.selectedImage!.path));
              }
              */ /**/ /*else if((model.selectedImage != null) && (model.downloaded != null)){
                return Image.network(model.downloaded!.imageUrl);//Text('Image from DB');
              }*/ /**/ /*
              else {
                return Text(
                  tapToAddBannerTxt,
                  style: textStyle14FW400DarkGrey,
                  //textAlign: TextAlign.center,
                );
              }
            }
        ),*/ /*
        child: (model.selectedImage == null) ? Text(
          tapToAddTxt,
          style:
              textStyle14FW400DarkGrey,
          //textAlign: TextAlign.center,
        ) : Image.file(File(model.selectedImage!.path)),
      ),
    );
  }
}*/
