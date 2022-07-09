import 'package:flutter/material.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/ui/screens/reusable_views_components.dart';
import 'package:mhg/ui/screens/user_access/user_access_components.dart';
import 'package:mhg/ui/screens/user_access/user_access_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';
import 'package:stacked/stacked.dart';

import '../helpers/reusable_widgets.dart';

class UserAccessView extends StatefulWidget {
  const UserAccessView({Key? key}) : super(key: key);

  @override
  _UserAccessViewState createState() => _UserAccessViewState();
}

class _UserAccessViewState extends State<UserAccessView> {
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserAccessViewModel>.reactive(
      viewModelBuilder: () => UserAccessViewModel(),
      builder: (context, model, child) => GestureDetector(
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
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    reverse: true,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                appName,
                                style: appNameTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                appMotto,
                                style: tosTextStyleWhiteReg9,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 160.0,
                            ),
                            buildCustomTextField(
                              textEditingController: _emailTextController,
                              sizeOfTF: sizeW326H50,
                              tfPadding: symPaddingVert8Hor36,
                              hintText: emailHintText,
                              prefixIcon:
                                  buildIcon(icon: emailIcon, color: grey),
                              textInputType: TextInputType.emailAddress,
                            ),
                            buildCustomTextField(
                              textEditingController: _passwordTextController,
                              sizeOfTF: sizeW326H50,
                              tfPadding: symPaddingVert8Hor36,
                              hintText: passwordHintText,
                              prefixIcon:
                                  buildIcon(icon: passwordIcon, color: grey),
                              obscureText: true,
                            ),
                            Padding(
                              padding: paddingBottomOnly9,
                              child: TextButton(
                                onPressed: () =>
                                    print('Forget password button pressed'),
                                child: customText(text: forgetPassword),
                              ),
                            ),
                            signInBtn(
                              textLabel: signIn,
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            ),
                            buildRowWithTextAndTB(
                              textLabel: didNotHaveAnyAcc,
                              textOnTB: signUpHere,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
