import 'package:flutter/material.dart';
import 'package:mhg/ui/screens/helpers/reusable_widgets.dart';
import 'package:mhg/ui/screens/user_access/user_access_view_model.dart';

final UserAccessViewModel _userAccessViewModel = UserAccessViewModel();

Padding signInBtn({
  required String textLabel,
  required String email,
  required String password,
}) {
  return Padding(
    padding: symPaddingVert8Hor36,
    child: ElevatedButton(
      onPressed: () => _userAccessViewModel.logIn(email: email, password: password),
      child: Text(textLabel),
    ),
  );
}