import 'package:mhg/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

/// Contains the setup(arrange) functions and attributes to remove any duplicate
/// code from tests, as well as make a test more readable by putting all of the
/// setup helpers into one function call

final navService = locator<NavigationService>();
