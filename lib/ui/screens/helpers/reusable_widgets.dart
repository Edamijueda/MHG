import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';

import '../../../constants.dart';
import '../reusable_views_components.dart';

final MhgBaseViewModel _mhgBaseViewModel = MhgBaseViewModel();

const IconData emailIcon = Icons.mail_outline_rounded;
const IconData passwordIcon = Icons.lock_outline_rounded;
const IconData nameIcon = Icons.person;
const IconData userAccountIcon = Icons.account_circle_outlined;
const IconData helpIcon = Icons.help;
const IconData dobIcon = Icons.cake;
const IconData validIdIcon = Icons.badge;
const IconData businessNameIcon = Icons.business_center;
const IconData businessLNIcon = Icons.pin;
const IconData menuIcon = Icons.menu_open;
const IconData cartIcon = Icons.shopping_cart_outlined;
const IconData searchIcon = Icons.search_rounded;
const IconData doubleArrowIcon = Icons.double_arrow;
const IconData moreOptionIcon = Icons.more_horiz;
const IconData homeIcon = Icons.home_outlined;
const IconData orderIcon = Icons.shopping_bag_outlined;
const IconData saveItemIcon = Icons.save_outlined;
const IconData helpIconOutline = Icons.help_outline;
const IconData logoutIcon = Icons.logout;
const IconData addToCartIcon = Icons.add_shopping_cart;

/*const Padding symPaddingVert9Hor36 = Padding(
  padding: EdgeInsets.symmetric(
    vertical: 9.0,
    horizontal: 36.0,
  ),
);*/

const EdgeInsets symPaddingVert8Hor36 = EdgeInsets.symmetric(
  vertical: 8.0,
  horizontal: 36.0,
);

const EdgeInsets paddingFromL36T18R36B9 =
    EdgeInsets.fromLTRB(36.0, 18.0, 36.0, 9.0);

/*const EdgeInsets paddingFromL36T9R36B18 =
EdgeInsets.fromLTRB(36.0, 9.0, 36.0, 18.0);*/

const EdgeInsets paddingBottomOnly9 = EdgeInsets.only(bottom: 9.0);

//const EdgeInsets paddingBottomOnly30 = EdgeInsets.only(bottom: 30.0);

/*symmetric(
  vertical: 18.0,
  horizontal: 36.0,
);*/

RoundedRectangleBorder rRectWithCircularBR10 = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
);

Icon buildIcon({
  required IconData icon,
  required Color color,
  double? size,
}) {
  return Icon(
    icon,
    color: color,
    size: size,
    //size: prefixIconSize,
  );
}

// Dis should be deleted, if same is found in reusable_views_components
/*Widget buildCustomTextField({
  required String hintText,
  required Widget prefixIcon,
  TextInputType? textInputType,
  final bool obscureText = false,
}) {
  return Padding(
    padding: symPaddingVert8Hor36,
    child: SizedBox.fromSize(
      size: size,
      child: TextField(
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ),
    ),
  );
}*/

///////////////////////////////////////////////////////////////////////

Widget buildTabRowLabel({
  required String textLabel,
  //required TextStyle style,
  TextStyle? style,
  IconButton? includeIconBtn,
}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
    horizontalTitleGap: 0.0,
    minLeadingWidth: 0.0,
    title: Center(
      child: customTextPlusStyle(
        text: textLabel,
        textStyle: style,
      ),
    ),
    trailing: includeIconBtn,
  );

  /*return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        textLabel,
        style: textStyleWhiteBold16,
      ),
      includeIconBtn,
      */ /* helpIconButton(
        consoleOutput: cusAndRetIconBtHelpText,
        color: white,
      ),*/ /*
    ],
  );*/
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

const List<String> customerTVHintTexts = [
  firstNameHintTxt,
  lastNameHintText,
  emailHintTxt,
  passwordHintText,
  dobHintText,
];

const List<String> retailerTVHintTexts = [
  bizOwnerHintText,
  businessNameHintText,
  emailHintTxt,
  passwordHintText,
  businessLNHintText,
];

const List<IconData> customerTVIcons = [
  nameIcon,
  userAccountIcon,
  emailIcon,
  passwordIcon,
  dobIcon,
];

const List<IconData> retailerTVIcons = [
  nameIcon,
  businessNameIcon,
  emailIcon,
  passwordIcon,
  businessLNIcon,
];

const List<TextInputType>? tabViewTextInputTypes = [
  TextInputType.name,
  TextInputType.emailAddress,
];

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

Column buildTabBarView({
  required List<String> hintTextList,
  required List<IconData> prefixIconList,
  List<TextInputType>? textInputTypeList,
  required String textOnEB,
  //required SignUpViewModel signUpViewModel,
}) {
  return Column(
    children: <Widget>[
      buildCustomTextField(
        sizeOfTF: sizeW326H50,
        tfPadding: symPaddingVert8Hor36,
        hintText: hintTextList[0],
        prefixIcon: buildIcon(
            icon: prefixIconList[0], color: grey, size: prefixIconSize),
        textInputType: textInputTypeList![0],
      ),
      buildCustomTextField(
        sizeOfTF: sizeW326H50,
        tfPadding: symPaddingVert8Hor36,
        hintText: hintTextList[1],
        prefixIcon: buildIcon(
            icon: prefixIconList[1], color: grey, size: prefixIconSize),
      ),
      buildCustomTextField(
        sizeOfTF: sizeW326H50,
        tfPadding: symPaddingVert8Hor36,
        hintText: hintTextList[2],
        prefixIcon: buildIcon(
            icon: prefixIconList[2], color: grey, size: prefixIconSize),
        textInputType: textInputTypeList[1],
      ),
      buildCustomTextField(
        sizeOfTF: sizeW326H50,
        tfPadding: symPaddingVert8Hor36,
        hintText: hintTextList[4],
        prefixIcon: buildIcon(
            icon: prefixIconList[4], color: grey, size: prefixIconSize),
      ),
      buildCustomTextField(
        sizeOfTF: sizeW326H50,
        tfPadding: symPaddingVert8Hor36,
        hintText: hintTextList[3],
        prefixIcon: buildIcon(
            icon: prefixIconList[3], color: grey, size: prefixIconSize),
        obscureText: true,
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
            Text(
              validIdHintText,
              style: hintTextStyle,
            ),
            SizedBox(
              width: 46.0, //prev used 66.0
            ),
            ElevatedButton(
              onPressed: () => print('Upload button pressed'),
              child: Text(upload),
              style: ElevatedButton.styleFrom(
                minimumSize: overrideMinSize,
                fixedSize: uploadBtSize,
                shape: rRectWithCircularBR10,
                textStyle: uploadEBTextStyle,
              ),
            ),
            buildIconButton(
              padding: const EdgeInsets.all(8.0), // default from flutter
              icon: buildIcon(icon: helpIcon, color: grey, size: iconBtnSize),
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
      buildElevatedButton(textLabel: textOnEB),
    ],
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

Padding buildElevatedButton({
  required String textLabel,
  //SignUpViewModel signUpViewModel,
}) {
  return Padding(
    padding: symPaddingVert8Hor36,
    child: ElevatedButton(
      onPressed: () =>
          _mhgBaseViewModel.validateScreenToNavTo(eBText: textLabel),
      //onPressed: () => print('SignIn button pressed'),
      child: Text(textLabel),
    ),
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Used by customer_home_component, AdminHomeView
Divider buildDivider() {
  return Divider(
    color: backgroundColour, //greyDark,
    indent: 20.0,
    endIndent: 20.0,
    thickness: 1.0,
    height: 20.0,
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

Row buildRowWithTextAndTB({
  required String textLabel,
  required String textOnTB,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      customTextPlusStyle(text: textLabel, textStyle: textStyle14FW400White),
      customTextBtn(
        onPressed: () =>
            _mhgBaseViewModel.validateScreenToNavTo(eBText: textOnTB),
        btnColour: primaryColour,
        btnTxt: textOnTB,
        btnTextStyle: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

Text customTextPlusStyle({
  required String text,
  //required TextStyle textStyle,
  TextStyle? textStyle,
}) {
  return Text(
    text,
    style: textStyle,
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

Text customText({
  required String text,
}) {
  return Text(
    text,
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

class MhgAppBarTitleWidget extends StatelessWidget {
  const MhgAppBarTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 45.0,
        ),
        Image(
          image: ExactAssetImage(
            'lib/assets/app_icon.png',
          ),
          height: 20.0, //26.0 is used before
          width: 20.0,
        ),
        Text(
          displayedAppName,
          style: textStyle14Bold,
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

IconButton buildIconButton({
  required Widget icon,
  required String onClickPrintOnConsole,
  required EdgeInsetsGeometry padding,
}) {
  return IconButton(
    padding: padding,
    icon: icon,
    onPressed: () => print(onClickPrintOnConsole),
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

TabBar build2ColumnTabBar({
  required String text4column1,
  required String text4column2,
  required TextStyle textStyle,
  IconButton? iconButton,
  IconButton? iconButton1,
  final Decoration? indicatorDeco,
  final TabBarIndicatorSize? provideIndicatorSize,
  //required Color labelColour,
}) {
  return TabBar(
    labelPadding: EdgeInsets.only(left: 26.0, right: 26.0), //prev 10.0
    padding: EdgeInsets.only(bottom: 10.0),
    indicator: indicatorDeco,
    indicatorSize: provideIndicatorSize,
    tabs: <Widget>[
      Center(
        child: Tab(
          child: buildTabRowLabel(
            textLabel: text4column1,
            style: textStyle,
            includeIconBtn: iconButton,
          ),
        ),
      ),
      Center(
        child: Tab(
          child: buildTabRowLabel(
            textLabel: text4column2,
            style: textStyle,
            includeIconBtn: iconButton1,
          ),
        ),
      ),
    ],
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Used by AdminHomeView in 2 places, customer_home_components, reusable_widgets
// (for SignupView)
TextButton customTextBtn({
  required VoidCallback? onPressed,
  required Color? btnColour,
  required btnTxt,
  final TextStyle? btnTextStyle,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      primary: btnColour, //primaryColour,
    ),
    child: Text(
      btnTxt,
      style: btnTextStyle,
    ),
  );
}

//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
