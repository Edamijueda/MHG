import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/ui/screens/customer/view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatefulWidget {
  final List<Device>? cartItems;

  const CartView({Key? key, this.cartItems}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerViewModel>.reactive(
      viewModelBuilder: () => CustomerViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: grey,
        /*body: Center(
          child: Text('All artwork, products added for purchase'),*/
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            Container(
              //alignment: Alignment.center,
              height: 150.0,
              //width: 150.0,
              color: greyDark,
            ),
            SizedBox(height: 20.0),
            (() {
              if (model.rCartItems != null && model.rCartItems!.isNotEmpty) {
                return Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: ExpansionPanelList.radio(
                      children:
                          model.rCartItems!.map<ExpansionPanelRadio>((device) {
                        return ExpansionPanelRadio(
                          backgroundColor: backgroundColour,
                          value: model.rCartItems!.iterator,
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${device.title}   ',
                                    style: TextStyle(color: greyDark),
                                  ),
                                  Text('   ${device.price}'),
                                ],
                              ),
                            );
                          },
                          body: ListTile(
                            tileColor: greyDark, //Colors.teal,
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      //fit: BoxFit.fitHeight,
                                      height: 150.0,
                                      imageUrl: device.url,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) {
                                        if (downloadProgress.progress != null) {
                                          final percent =
                                              (downloadProgress.progress! * 100)
                                                  .round();
                                          return Text(
                                              '$percent% done loading from database');
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  device.deviceType!,
                                  //style: bodyText2, //TextStyle(color: grey),
                                ),
                                Text(
                                  device.description,
                                  //style: bodyText2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 18.0),
                                          child: TextButton(
                                            onPressed: () =>
                                                model.remFromCartItems(device),
                                            //onPressed: () => print('Cancel btn pressed'),
                                            child: Text(
                                              'remove',
                                              /*style: TextStyle(
                                                  color: Colors.red.shade900),*/
                                            ),
                                          ),
                                        ),
                                      ),
                                      /*Flexible(
                                        child: SizedBox(
                                          height: 28.0,
                                          width: 94.0,
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                model.approveRequest(device),
                                            //onPressed: () => print('Submit btn pressed'),
                                            child: Text('Approve'),
                                          ),
                                        ),
                                      ), */
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200.0),
                    Center(
                      child: Text(
                        'cart page empty. No item has been added',
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }
            }()),
          ],
        ),
      ),
    );
  }
}
