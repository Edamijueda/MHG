import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/sign_up/components.dart';
import 'package:mhg/ui/screens/sign_up/signup_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

import '../helpers/reusable_widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/assets/bg_image.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(140.0), // prev used 156
                    child: SafeArea(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        title: MhgAppBarTitleWidget(),
                        bottom: build2ColumnTabBar(
                          text4column1: customer,
                          text4column2: retailer,
                          textStyle: textStyleWhiteBold16,
                          iconButton: buildIconButton(
                            padding: const EdgeInsets.all(4.0), //default is 8.0
                            icon: buildIcon(
                              icon: helpIcon,
                              color: white,
                              size: iconBtnSize,
                            ),
                            onClickPrintOnConsole: customerIconBtnHelpText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  body: SizedBox(
                    height: 700.0, //MediaQuery.of(context).size.height, 600
                    //width: MediaQuery.of(context).size.width,
                    child: ListView(
                      shrinkWrap: true,
                      reverse: true,
                      children: <Widget>[
                        SizedBox(
                          height: 520.0, //540
                          child: TabBarView(
                            children: <Widget>[
                              SignupTabBarView(
                                hintTextList: customerTVHintTexts,
                                prefixIconList: customerTVIcons,
                                textInputTypeList: tabViewTextInputTypes,
                                textOnEB: signUpAsCustomer,
                              ),
                              SignupTabBarView(
                                hintTextList: retailerTVHintTexts,
                                prefixIconList: retailerTVIcons,
                                textInputTypeList: tabViewTextInputTypes,
                                textOnEB: signUpAsRetailer,
                              ),
                            ],
                          ),
                        ),
                        buildRowWithTextAndTB(
                          textLabel: ifYouHaveAnAccount,
                          textOnTB: signInHere,
                        ),
                      ].reversed.toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
