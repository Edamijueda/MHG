import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/core/models/request/request.dart';
import 'package:mhg/ui/theme/colours.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserFsService with ReactiveServiceMixin {
  final log = getStackedLogger('UserFsService');
  final ReusableFunction reusableFunction = ReusableFunction();
  final DialogService _dialogService = locator<DialogService>();
  final String signupReqTxt =
      'Request successful. You will get an approval mail soon after review. You '
      'will need the email and password you provided for login later. Thank you!';
  late CollectionReference _collectionRef;

  UserFsService() {
    listenToReactiveValues([
      _rTier1Banner,
      _rTier2Banner,
      _rTier3Banner,
      _rTier1Artworks,
      _rTier2Artworks,
      _rTier3Artworks,
      _rPipe,
      _rGrinder,
      _rRoller,
      _rTaster,
      _rBong,
      _rDabRing,
      _rBubble,
    ]);
  }

  Future pushAccCreationReq({required SignupRequest reqData}) async {
    log.i(
        'has param reqData, which has lastNorBizN: ${reqData.lastNorBizN}, \n '
        'vIdStoragePath: ${reqData.vIdStoragePath}, \n storageDownloadUrl: '
        '${reqData.validIdCard}, \n uid: ${reqData.uid}');
    _collectionRef = FirebaseFirestore.instance.collection(signupReqPathTxt);
    //SignupRequest dataFromFS;
    try {
      await _collectionRef.doc(reqData.uid).set(reqData.toMap()).then((value) {
        _dialogService.showDialog(
          title: 'Account creation status',
          description: signupReqTxt,
          buttonTitleColor: black,
          barrierDismissible: true,
        );
        FirebaseAuth.instance.signOut();
        /*reusableFunction.snackBar(
            message: 'Your request to create and account has been sent.',
            duration: const Duration(seconds: 3));*/
      });
    } catch (e) {
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  //                   ReactiveBanners Realtime update
  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<Banner?> _rTier1Banner = ReactiveValue<Banner?>(null);

  Banner? get rTier1Banner => _rTier1Banner.value;

  void getTier1RtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance
        .collection(bannerTxt)
        .doc(firstTierTxt) //firstTierTxt as d PATH
        .snapshots()
        .listen(
      (event) async {
        var docRef = event.reference.withConverter(
            fromFirestore: Banner.fromDocument,
            toFirestore: (Banner banner, _) => banner.toMap());
        final docSnap = await docRef.get();
        _rTier1Banner.value = docSnap.data();

        log.i(
          'banner return: ${_rTier1Banner.value?.bannerName} \n '
          'and image url: ${_rTier1Banner.value?.bannerUrl}',
        );
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
    log.i(
      'banner return outside d listen method: ${_rTier1Banner.value?.bannerName}'
      ' \n and image url: ${_rTier1Banner.value?.bannerUrl}',
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<Banner?> _rTier2Banner = ReactiveValue<Banner?>(null);

  Banner? get rTier2Banner => _rTier2Banner.value;

  void getTier2RtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance
        .collection(bannerTxt)
        .doc(secondTierTxt) //secondTierTxt as d PATH
        .snapshots()
        .listen(
      (event) async {
        var docRef = event.reference.withConverter(
            fromFirestore: Banner.fromDocument,
            toFirestore: (Banner banner, _) => banner.toMap());
        final docSnap = await docRef.get();
        _rTier2Banner.value = docSnap.data();

        log.i(
          'banner return: ${_rTier2Banner.value?.bannerName} \n '
          'and image url: ${_rTier2Banner.value?.bannerUrl}',
        );
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
    log.i(
      'banner return outside d listen method: ${_rTier2Banner.value?.bannerName}'
      ' \n and image url: ${_rTier2Banner.value?.bannerUrl}',
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<Banner?> _rTier3Banner = ReactiveValue<Banner?>(null);

  Banner? get rTier3Banner => _rTier3Banner.value;

  void getTier3RtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance
        .collection(bannerTxt)
        .doc(thirdTierTxt) //thirdTierTxt as d PATH
        .snapshots()
        .listen(
      (event) async {
        var docRef = event.reference.withConverter(
            fromFirestore: Banner.fromDocument,
            toFirestore: (Banner banner, _) => banner.toMap());
        final docSnap = await docRef.get();
        _rTier3Banner.value = docSnap.data();

        log.i(
          'banner return: ${_rTier3Banner.value?.bannerName} \n '
          'and image url: ${_rTier3Banner.value?.bannerUrl}',
        );
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
    log.i(
      'banner return outside d listen method: ${_rTier3Banner.value?.bannerName}'
      ' \n and image url: ${_rTier3Banner.value?.bannerUrl}',
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  //                       ReactiveArtworks Realtime update
  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Artwork>?> _rTier1Artworks =
      ReactiveValue<List<Artwork>?>(null);

  List<Artwork>? get rTier1Artworks => _rTier1Artworks.value;

  tier1ArtworkRtUpdate() {
    //Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance
        .collection(firstTierArtworkTxt) // firstTierArtworkTxt as PATH
        .snapshots()
        .listen(
      (event) {
        _rTier1Artworks.value =
            event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Artwork>?> _rTier2Artworks =
      ReactiveValue<List<Artwork>?>(null);

  List<Artwork>? get rTier2Artworks => _rTier2Artworks.value;

  tier2ArtworkRtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance
        .collection(secondTierArtworkTxt) // secondTierArtworkTxt as PATH
        .snapshots()
        .listen(
      (event) {
        _rTier2Artworks.value =
            event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Artwork>?> _rTier3Artworks =
      ReactiveValue<List<Artwork>?>(null);

  List<Artwork>? get rTier3Artworks => _rTier3Artworks.value;

  tier3ArtworkRtUpdate() {
    //Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance
        .collection(thirdTierArtworkTxt) // thirdTierArtworkTxt as PATH
        .snapshots()
        .listen(
      (event) {
        _rTier3Artworks.value =
            event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  //                    CUSTOMER REACTIVE DEVICE functions
  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rPipe =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rPipe => _rPipe.value;

  pipeRtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance.collection(pipeDbPathTxt).snapshots().listen(
      (event) {
        _rPipe.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rGrinder =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rGrinder => _rGrinder.value;

  grinderRtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance.collection(grinderDbPathTxt).snapshots().listen(
      (event) {
        _rGrinder.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rRoller =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rRoller => _rRoller.value;

  rollerRtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance.collection(rollerDbPathTxt).snapshots().listen(
      (event) {
        _rRoller.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rTaster =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rTaster => _rTaster.value;

  tasterRtUpdate() {
    // Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance.collection(tasterDbPathTxt).snapshots().listen(
      (event) {
        _rTaster.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rBong =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rBong => _rBong.value;

  bongRtUpdate() {
    //Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance.collection(bongDbPathTxt).snapshots().listen(
      (event) {
        _rBong.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rDabRing =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rDabRing => _rDabRing.value;

  dabRingRtUpdate() {
    //Rt means Realtime
    log.i('no parameter');
    FirebaseFirestore.instance.collection(dabRingDbPathTxt).snapshots().listen(
      (event) {
        _rDabRing.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i('Listener failed with error: $error'),
    );
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _rBubble =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get rBubble => _rBubble.value;

  bubbleRtUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(bubbleDbPathTxt).snapshots().listen(
      (event) {
        _rBubble.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
      },
      onError: (error) => log.i(
          '$bubbleDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }
}
