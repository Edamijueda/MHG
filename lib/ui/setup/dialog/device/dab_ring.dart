import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/admin/devices/dab_ring/view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:mhg/utils/formatter/currency.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DabRingEntryView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const DabRingEntryView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<DabRingEntryView> createState() => _DabRingEntryViewState();
}

class _DabRingEntryViewState extends State<DabRingEntryView> {
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
    return ViewModelBuilder<DabRingViewModel>.reactive(
      viewModelBuilder: () => DabRingViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: greyDark,
        child: Container(
          width: 305.0,
          height: 500.0, // prev height used 500.0
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ImageSelectionContainer(model: model),
                  GestureDetector(
                    onTap: () {
                      model.selectImage();
                    },
                    child: Container(
                      width: 220.0,
                      height: 150.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: borderRadius10,
                      ),
                      //(model.bannerDataFromFirestore() != null)
                      child: (model.selectedImage == null)
                          ? Text(
                              tapToAddTxt,
                              style: textStyle14FW400DarkGrey,
                              //textAlign: TextAlign.center,
                            )
                          : Image.file(File(model.selectedImage!.path)),
                    ),
                  ),
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
                                if (model.selectedImage == null) {
                                  //model.showSnackBar();
                                } else {
                                  setState(() {
                                    if (titleController.text.isEmpty) {
                                      titleValidator = true;
                                    } else if (descController.text.isEmpty) {
                                      descValidator = true;
                                    } else if (priceController.text.isEmpty) {
                                      priceValidator = true;
                                    } else {
                                      widget.onDialogTap(
                                        DialogResponse(
                                          data: [
                                            model.selectedImage,
                                            titleController.text,
                                            descController.text,
                                            toCurrency.format(int.parse(
                                                priceController.text)),
                                            //priceController.text,
                                          ],
                                        ),
                                      );
                                    }
                                  });
                                }
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
