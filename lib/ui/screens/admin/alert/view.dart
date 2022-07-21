import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/alert/view_model.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';

class AlertView extends StatefulWidget {
  const AlertView({Key? key}) : super(key: key);

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlertViewModel>.reactive(
      viewModelBuilder: () => AlertViewModel(),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.0),
                  Text('Review Signup Request'),
                  IconButton(
                    onPressed: () => model.logout(),
                    icon: Icon(
                      logoutIcon,
                      color: Colors.red,
                      size: 20.0,
                    ),
                    tooltip: logoutTxt,
                  )
                ],
              ),
              SizedBox(height: 40.0),
              (() {
                if (model.rSignupReq != null && model.rSignupReq!.isNotEmpty) {
                  return ExpansionPanelList.radio(
                    children:
                        model.rSignupReq!.map<ExpansionPanelRadio>((request) {
                      return ExpansionPanelRadio(
                        backgroundColor: backgroundColour,
                        value: request.uid,
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Row(
                              children: [
                                Text(
                                  '${request.userType}:  ',
                                  style: TextStyle(color: greyDark),
                                ),
                                Text('  ${request.lastNorBizN}'),
                              ],
                            ),
                          );
                        },
                        body: ListTile(
                          tileColor: greyDark, //Colors.teal,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                request.firstNorBizOwnerN,
                                //style: bodyText2, //TextStyle(color: grey),
                              ),
                              Text(
                                request.dobOrBizLicenseNo,
                                //style: bodyText2,
                              ),
                              Text(
                                request.email,
                                //style: bodyText2,
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    //fit: BoxFit.fitHeight,
                                    height: 150.0,
                                    imageUrl: request.validIdCard,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18.0),
                                        child: TextButton(
                                          onPressed: () =>
                                              model.rejectRequest(request),
                                          //onPressed: () => print('Cancel btn pressed'),
                                          child: Text(
                                            'Reject',
                                            style: TextStyle(
                                                color: Colors.red.shade900),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 28.0,
                                        width: 94.0,
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              model.approveRequest(request),
                                          //onPressed: () => print('Submit btn pressed'),
                                          child: Text('Approve'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return Center(
                      child:
                          Text('There is no request at this time. Check back'));
                }
              }()),
            ],
          ),
        ),
      ),
      onModelReady: (model) => model.realtimeOperations(),
    );
  }
}
