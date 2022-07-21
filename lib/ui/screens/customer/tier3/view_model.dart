import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/core/services/user/firestore.dart';
import 'package:mhg/ui/screens/customer/view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomerTier3ViewModel extends CustomerViewModel {
  final log = getStackedLogger('CustomerTier3ViewModel');
  final UserFsService _userFsService = locator<UserFsService>();
  //final UserStorageService _userStorageService = locator<UserStorageService>();
  final DialogService _dialogService = locator<DialogService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_userFsService];

  // ReactiveService value getters
  Banner? get reactiveBanner => _userFsService.rTier3Banner;
  List<Artwork>? get reactiveArtworks => _userFsService.rTier3Artworks;

  callRealTimeOperations() {
    callBannerRealtimeUpdate();
    callArtworkRealtimeUpdate();
  }

  callBannerRealtimeUpdate() {
    _userFsService.getTier3RtUpdate();
    /*if (reactiveBannerData == null) {
      // _bannerDataFromFirestore;
      _selectedImage = null;
    }*/
    /*if (reactiveBannerData != null) {
      _selectedImage = null;
    }*/
    /*log.i(
        'bannerDataFromFirestore get the return title : ${_userFsService.tryingAnApproach?.bannerName}');*/
  }

  void callArtworkRealtimeUpdate() {
    _userFsService.tier3ArtworkRtUpdate();
  }

  @override
  Future viewDetails(Artwork artwork) async {}
}
