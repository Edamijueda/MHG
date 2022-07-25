import 'package:flutter/material.dart';
import 'package:mhg/core/models/profile/profile.dart';
import 'package:mhg/ui/screens/MHG_base/mhg_base_view_model.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/ui/theme/typography.dart';

import 'helpers/reusable_widgets.dart';

Widget buildCustomTextField({
  required Size sizeOfTF,
  TextStyle? hintTS,
  required String hintText,
  required Widget prefixIcon,
  required EdgeInsetsGeometry tfPadding,
  TextInputType? textInputType,
  final bool obscureText = false,
  InputBorder? inputBorder,
  TextEditingController? textEditingController,
}) {
  return Padding(
    padding: tfPadding,
    child: SizedBox.fromSize(
      size: sizeOfTF,
      child: TextField(
        keyboardType: textInputType,
        obscureText: obscureText,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintTS,
          prefixIcon: prefixIcon,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
        ),
      ),
    ),
  );
}

class NavDrawer extends StatelessWidget {
  final UserProfile profile;
  const NavDrawer({
    Key? key,
    required MhgBaseViewModel mhgBaseViewModel,
    required this.profile,
  })  : _mhgBaseViewModel = mhgBaseViewModel,
        super(key: key);

  final MhgBaseViewModel _mhgBaseViewModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: greyLike, //backgroundColour,
      // Add a ListView to the drawer. This ensures the profile can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 20.0),
            child: Text(
              profile.lastNorBizN,
              style: textStyle18Bold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.0),
          Divider(
            color: Colors.grey, //primaryColour,
            indent: 20.0,
            endIndent: 20.0,
            thickness: 1.0,
            height: 40.0,
          ),
          ListTile(
            //style: textStyle14FW400White,
            minLeadingWidth: 20.0,
            leading: buildIcon(icon: homeIcon, color: greyDark),
            title: const Text(
              'Home',
            ),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          /*ListTile(
            //style: textStyle14FW400White,
            minLeadingWidth: 20.0,
            leading: buildIcon(icon: orderIcon, color: greyDark),
            title: const Text(
              'Order history',
            ),
            onTap: () {
              _mhgBaseViewModel.goToOrderHistoryScreen();
              // Update the state of the app.
              // ...
            },
          ),*/
          /*ListTile(
            //style: textStyle14FW400White,
            minLeadingWidth: 20.0,
            leading: buildIcon(icon: saveItemIcon, color: greyDark),
            title: const Text(
              'Saved Items',
            ),
            onTap: () {
              _mhgBaseViewModel.goToSavedItemScreen();
              // Update the state of the app.
              // ...
            },
          ),*/
          /*ListTile(
            //style: textStyle14FW400White,
            minLeadingWidth: 20.0,
            leading: buildIcon(icon: userAccountIcon, color: greyDark),
            title: const Text(
              'Account settings',
            ),
            onTap: () {
              _mhgBaseViewModel.goToAccountSettingsScreen();
              // Update the state of the app.
              // ...
            },
          ),*/
          ListTile(
            //style: textStyle14FW400White,
            minLeadingWidth: 20.0,
            leading: buildIcon(icon: helpIconOutline, color: greyDark),
            title: const Text(
              'Help',
            ),
            onTap: () {
              _mhgBaseViewModel.goToHelpScreen();
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            //style: textStyle14FW400White,
            minLeadingWidth: 20.0,
            leading: buildIcon(icon: logoutIcon, color: greyDark),
            title: const Text(
              'Logout',
            ),
            onTap: () {
              _mhgBaseViewModel.goToUserAccessScreen();
              // Update the state of the app.
              // ...
            },
          ),
          Divider(
            color: Colors.grey, //primaryColour,
            indent: 20.0,
            endIndent: 20.0,
            thickness: 1.0,
            height: 40.0,
          ),
          Center(
              child: Text(
            'Version: 1.0.0',
            style: textStyle14FW400DarkGrey,
          )),
        ],
      ),
    );
  }
}

class EmptyDevice extends StatelessWidget {
  final String deviceType;
  const EmptyDevice({
    Key? key,
    required this.deviceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Material(
        color: backgroundColour,
        elevation: 1.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          alignment: Alignment.center,
          child: Text('$deviceType are currently not available. Check back'),
        ),
      ),
    );
  }
}
