import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_viewmodel.dart';
import 'package:mhg/ui/screens/customer/device/view_model.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ProductDetailsView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    CustomerDeviceViewModel parentModel = CustomerDeviceViewModel();
    return ViewModelBuilder<Admin1stTierViewModel>.reactive(
      viewModelBuilder: () => Admin1stTierViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: Container(
          width: 305.0,
          height: 500.0, // prev height used 500.0
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.request.data.title,
                  style: TextStyle(fontSize: 18.0),
                  overflow: TextOverflow.ellipsis,
                ),
                /*Text(
                  widget.request.data.id,
                  style: TextStyle(fontSize: 18.0),
                ),*/
                SizedBox(height: 10.0),
                Expanded(
                  child: ClipRRect(
                    borderRadius: borderRadius10,
                    child: CachedNetworkImage(
                      imageUrl: widget.request.data.url,
                      /*imageUrl: widget.request.imageUrl ??
                          'https://previews.123rf.com/images/sebicla/sebicla1303/sebicla130300159/18458190-contact-admin.jpg',*/
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
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.request.data.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.white70),
                ),
                SizedBox(height: 10.0),
                Text(
                  'price: ${widget.request.data.price}',
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (widget.request.showIconInMainButton == true)
                        ? IconButton(
                            onPressed: () => widget.onDialogTap(
                              DialogResponse(confirmed: true),
                            ),
                            icon: Icon(
                              addToCartIcon,
                              color: primaryColour,
                            ),
                            tooltip: 'Add to Cart',
                          )
                        : SizedBox.fromSize(
                            size: Size(70.0, 28.0),
                            child: ElevatedButton(
                              onPressed: () => widget.onDialogTap(
                                DialogResponse(confirmed: true),
                              ),
                              child: Text('Ok'),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
