import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_components.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_view_model.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_components.dart';
import 'package:mhg/ui/screens/admin/tier1/tier1_viewmodel.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:mhg/ui/setup/dialog/product/product_entry_viewmodel.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/formatter/currency.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductEntryView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const ProductEntryView(
      {Key? key, required this.request, required this.onDialogTap})
      : super(key: key);

  @override
  State<ProductEntryView> createState() => _ProductEntryViewState();
}

class _ProductEntryViewState extends State<ProductEntryView> {
  late final TextEditingController descController;
  late final TextEditingController priceController;
  late final TextEditingController titleController;

  final String errorMsg = 'Can\'t be null';
  bool validate = false;
  bool titleValidator = false;
  bool descValidator = false;
  bool priceValidator = false;

  @override
  void initState() {
    super.initState();
    descController = TextEditingController();
    priceController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    descController.dispose();
    priceController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Admin1stTierViewModel>.reactive(
      viewModelBuilder: () => Admin1stTierViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: Container(
          //margin: EdgeInsets.all(20.0),
          //color: greyDark,
          width: 305.0,
          height: 500.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSelectionContainer(model: model),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                    child: TextField(
                      controller: descController,
                      textInputAction: TextInputAction.newline,
                      maxLength: 150,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: false,
                        hintText: descHintTxt,
                        errorText: descValidator ? errorMsg : null,
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade700),
                          borderRadius: borderRadius10,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120.0,
                        child: TextField(
                          controller: titleController,
                          onSubmitted: (value) {
                            print('Name is: $value');
                          },
                          decoration: InputDecoration(
                            filled: false,
                            hintText: titleTxt,
                            errorText: titleValidator ? errorMsg : null,
                            enabledBorder: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                        child: TextField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          /*onSubmitted: (value) {
                            value = toCurrency.format(int.parse(value));
                            print('Price is: $value');
                          },*/
                          decoration: InputDecoration(
                            filled: false,
                            hintText: priceHintTxt,
                            errorText: priceValidator ? errorMsg : null,
                            enabledBorder: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: TextButton(
                              onPressed: () => widget.onDialogTap(
                                DialogResponse(confirmed: false),
                              ),
                              //onPressed: () => print('Cancel btn pressed'),
                              child: Text('Cancel'),
                            ),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 28.0,
                            width: 90.0,
                            child: ElevatedButton(
                              onPressed: () {
                                if(model.selectedImage == null) {
                                  //model.showSnackBar();
                                }
                                else {
                                  setState(() {
                                    if(titleController.text.isEmpty) {
                                      titleValidator = true;
                                    } else if(descController.text.isEmpty) {
                                      descValidator = true;
                                    } else if(priceController.text.isEmpty) {
                                      priceValidator = true;
                                    } else {
                                      widget.onDialogTap(
                                        DialogResponse(
                                          data: [
                                            model.selectedImage,
                                            titleController.text,
                                            descController.text,
                                            toCurrency.format(int.parse(priceController.text)),//priceController.text,
                                          ],
                                        ),
                                      );
                                    }
                                  });
                                }
                                /*widget.onDialogTap(
                                  DialogResponse(
                                    data: [
                                      titleController.text,
                                      descController.text,
                                      priceController.text,
                                    ],
                                  ),
                                );*/
                              },
                              //onPressed: () => print('Submit btn pressed'),
                              child: Text('Submit'),
                            ),
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
      ),
    );
  }
}
