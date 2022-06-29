import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';

class DeviceCard extends StatelessWidget {
  final Device device;
  final dynamic model;

  const DeviceCard({
    Key? key,
    required this.device,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColour,
      elevation: 1.0,
      borderRadius: BorderRadius.circular(15.0),
      child: InkWell(
        onTap: () => model.viewDeviceDetails(device),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0, //10.0
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      child: CachedNetworkImage(
                        //fit: BoxFit.fitHeight,
                        height: 132.0,
                        imageUrl: device.url,
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
                Text(
                  device.title,
                  style: textStyle11FW400,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        device.price,
                        style: uploadEBTextStyle,
                      ),
                      //SizedBox(width: 25.0),
                      IconButton(
                        onPressed: () => model.deleteDevice(device: device),
                        //padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                        icon: Icon(
                          Icons.delete,
                          size: 16.0,
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
