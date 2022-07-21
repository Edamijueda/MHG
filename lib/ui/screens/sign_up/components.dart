import 'package:flutter/material.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/screens/sign_up/signup_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

class SignupTabBarView extends StatefulWidget {
  final List<String> hintTextList;
  final List<IconData> prefixIconList;
  final List<TextInputType>? textInputTypeList;
  final String textOnEB;

  const SignupTabBarView({
    Key? key,
    required this.hintTextList,
    required this.prefixIconList,
    this.textInputTypeList,
    required this.textOnEB,
  }) : super(key: key);

  @override
  State<SignupTabBarView> createState() => _SignupTabBarViewState();
}

class _SignupTabBarViewState extends State<SignupTabBarView> {
  final log = getStackedLogger('_SignupTabBarViewState');
  late final TextEditingController controller;
  late final TextEditingController controller1;
  late final TextEditingController controller2;
  late final TextEditingController controller3;
  late final TextEditingController controller4;

  final String errorMsg = 'Can\'t be null';
  String? emailExistMsg;
  String? passwordErrorMsg;
  bool validate = false;
  bool validator = false;
  bool validator1 = false;
  bool validator2 = false;
  bool validator3 = false;
  bool validator4 = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Column(
        children: <Widget>[
          Padding(
            padding: symPaddingVert8Hor36,
            child: SizedBox.fromSize(
              size: sizeW326H50,
              child: TextField(
                controller: controller,
                keyboardType: widget.textInputTypeList![0],
                onSubmitted: (value) {
                  setState(() {
                    validator = false;
                  });
                },
                decoration: InputDecoration(
                  //filled: false,
                  hintText: widget.hintTextList[0],
                  prefixIcon: buildIcon(
                      icon: widget.prefixIconList[0],
                      color: grey,
                      size: prefixIconSize),
                  errorText: validator ? errorMsg : null,
                  errorStyle: TextStyle(color: Colors.red.shade500),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: symPaddingVert8Hor36,
            child: SizedBox.fromSize(
              size: sizeW326H50,
              child: TextField(
                controller: controller1,
                onSubmitted: (value) {
                  setState(() {
                    validator1 = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: widget.hintTextList[1],
                  prefixIcon: buildIcon(
                      icon: widget.prefixIconList[1],
                      color: grey,
                      size: prefixIconSize),
                  errorText: validator1 ? errorMsg : null,
                  errorStyle: TextStyle(color: Colors.red.shade500),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: symPaddingVert8Hor36,
            child: SizedBox.fromSize(
              size: sizeW326H50,
              child: TextField(
                controller: controller2,
                keyboardType: widget.textInputTypeList![1],
                onSubmitted: (value) async {
                  bool doesThisEmailExist = false;
                  doesThisEmailExist = await model.checkIfEmailExist(value);
                  log.i('doesThisEmailExist is: $doesThisEmailExist');
                  if (doesThisEmailExist) {
                    setState(() {
                      //Future<bool>
                      emailExistMsg = '$value already exist. Go signIn';
                      validator2 = true;
                      controller2.clear();
                    });
                  } else {
                    emailExistMsg = null;
                    validator2 = false;
                  }

                  // value = toCurrency.format(int.parse(value));
                  // print('Price is: $value');
                },
                decoration: InputDecoration(
                  //filled: false,
                  hintText: widget.hintTextList[2],
                  prefixIcon: buildIcon(
                      icon: widget.prefixIconList[2],
                      color: grey,
                      size: prefixIconSize),
                  errorText: (validator2)
                      ? (emailExistMsg != null)
                          ? emailExistMsg
                          : errorMsg
                      : null,
                  errorStyle: TextStyle(color: Colors.red.shade500),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: symPaddingVert8Hor36,
            child: SizedBox.fromSize(
              size: sizeW326H50,
              child: TextField(
                controller: controller3,
                onSubmitted: (value) {
                  setState(() {
                    validator3 = false;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  //filled: false,
                  hintText: widget.hintTextList[3],
                  prefixIcon: buildIcon(
                      icon: widget.prefixIconList[3],
                      color: grey,
                      size: prefixIconSize),
                  errorText: (validator3)
                      ? (passwordErrorMsg != null)
                          ? passwordErrorMsg
                          : errorMsg
                      : null,
                  errorStyle: TextStyle(color: Colors.red.shade500),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: symPaddingVert8Hor36,
            child: SizedBox.fromSize(
              size: sizeW326H50,
              child: TextField(
                controller: controller4,
                onSubmitted: (value) {
                  setState(() {
                    validator4 = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: widget.hintTextList[4],
                  prefixIcon: buildIcon(
                      icon: widget.prefixIconList[4],
                      color: grey,
                      size: prefixIconSize),
                  errorText: validator4 ? errorMsg : null,
                  errorStyle: TextStyle(color: Colors.red.shade500),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade500),
                    borderRadius: borderRadius10,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: symPaddingVert8Hor36,
            width: sizeW326H50.width,
            height: sizeW326H50.height,
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // The padding for the input decoration's container
                // If `isOutline` property of [border] is false and
                // if [filled] is true then `contentPadding` is
                // `EdgeInsets.fromLTRB(12, 8, 12, 8)`
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    top: 8.0,
                    right: 12.0,
                    bottom: 8.0,
                  ),
                  child: buildIcon(
                    icon: validIdIcon,
                    color: grey,
                    size: prefixIconSize,
                  ),
                ),
                Expanded(
                  child: Text(
                    (model.selectedImage == null)
                        ? validIdHintText
                        : model.selectedImage!.path,
                    style: hintTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                /*SizedBox(
                  width: 46.0, //prev used 66.0
                ),*/
                ElevatedButton(
                  onPressed: () {
                    model.uploadID();
                  },
                  child: Text(upload),
                  style: ElevatedButton.styleFrom(
                    minimumSize: overrideMinSize,
                    fixedSize: uploadBtSize,
                    shape: rRectWithCircularBR10,
                    textStyle: uploadEBTextStyle,
                  ),
                ),
                buildIconButton(
                  padding: const EdgeInsets.all(8.0),
                  // default from flutter
                  icon:
                      buildIcon(icon: helpIcon, color: grey, size: iconBtnSize),
                  onClickPrintOnConsole: validIdIconBtHelpText,
                ),
              ],
            ),
          ),
          Padding(
            padding: paddingFromL36T18R36B9,
            child: RichText(
              text: TextSpan(
                text: tOSText,
                style: tosTextStyleWhiteReg9,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Membership Agreement ',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: symPaddingVert8Hor36,
            child: ElevatedButton(
              onPressed: () {
                //model.goToNextScreen(widget.textOnEB);
                if (model.selectedImage == null) {
                  model.showSnackBar();
                } else {
                  setState(() {
                    if (controller.text.isEmpty) {
                      validator = true;
                    } else if (controller1.text.isEmpty) {
                      validator1 = true;
                    } else if (controller2.text.isEmpty) {
                      validator2 = true;
                    } else if (controller3.text.isEmpty) {
                      passwordErrorMsg = null;
                      validator3 = true;
                      /*if (controller3.text.isNotEmpty &&
                          controller3.text.length < 6) {
                        passwordErrorMsg =
                            'Password should be at least 6 characters';
                        validator3 = true;
                        controller3.clear();
                      }*/
                      /*if (controller3.text.isEmpty) {
                        passwordErrorMsg = null;
                        validator3 = true;
                      }*/
                    } else if (controller3.text.isNotEmpty &&
                        controller3.text.length < 6) {
                      passwordErrorMsg =
                          'Password should be at least 6 characters';
                      validator3 = true;
                      controller3.clear();
                    } else if (controller4.text.isEmpty) {
                      validator4 = true;
                    } else {
                      model.requestAccCreation([
                        controller.text,
                        controller1.text,
                        controller2.text,
                        controller3.text,
                        controller4.text,
                        model.selectedImage!.path,
                        widget.textOnEB,
                      ]);
                    }
                  });
                }
                log.i('userType is ${widget.textOnEB}');
              },
              //onPressed: () => print('SignIn button pressed'),
              child: Text('signUp as ${widget.textOnEB}'),
            ),
          ),
        ],
      ),
    );
  }
}
