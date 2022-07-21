import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/ui/setup/dialog/setup_dialog_ui.dart';
import 'package:mhg/ui/theme/themes.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );*/
  setupLocator(); // Dis will register d functions registered in d locator
  setupDialogUI(); // Dis will register our dialogUI
  Logger.level = Level.info;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemes(),
      // The stacked_services: package provide you with NavigationServices, DialogService,
      // snackBarServices, BottomSheetServices. We will like to show dem from our viewModel
      // and not have to do it inside of our UI code
      navigatorKey: StackedService.navigatorKey,
      // We construct a new instance of StackedRouter, dat is d router dart will
      // be generated when we run the 'flutter pub run build_runner build
      // --delete-conflicting-outputs' command. A app.router.dart file will be
      // created in the app folder.
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  } // flutter pub run build_runner build --delete-conflicting-outputs
}
