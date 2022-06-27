import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';

class FirestoreDbService with ReactiveServiceMixin {
  FirestoreDbService() {
    listenToReactiveValues([
      _tryingAnApproach,
      _reactiveListOfArtwork,
      _secTierReactiveListOfArtwork,
      _thirdTierReactiveListOfArtwork
    ]);
  }

  final log = getStackedLogger('FirestoreDbService');
  final ReusableFunction reusableFunction = ReusableFunction();
  late CollectionReference _collectionRef;

  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  // Reactive Values
  late final ReactiveValue<List<Artwork?>?> _reactiveListOfArtwork =
      ReactiveValue<List<Artwork?>?>(null);

  List<Artwork?>? get reactiveListOfArtwork => _reactiveListOfArtwork.value;
  late final ReactiveValue<List<Artwork?>?> _secTierReactiveListOfArtwork =
      ReactiveValue<List<Artwork?>?>(null);

  List<Artwork?>? get secTierReactiveListOfArtwork =>
      _secTierReactiveListOfArtwork.value;
  late final ReactiveValue<List<Artwork?>?> _thirdTierReactiveListOfArtwork =
      ReactiveValue<List<Artwork?>?>(null);

  List<Artwork?>? get thirdTierReactiveListOfArtwork =>
      _thirdTierReactiveListOfArtwork.value;

  late final ReactiveValue<Banner?> _tryingAnApproach =
      ReactiveValue<Banner?>(null);

  Banner? get tryingAnApproach => _tryingAnApproach.value;

  // Artwork? _artworkDataFromFirestore;
  //
  // Artwork? get artworkDataFromFirestore => _artworkDataFromFirestore;

  Future<Banner?> addBanner(Banner bannerData) async {
    log.i('bannerData as parameter, with name: ${bannerData.bannerName}');
    _collectionRef = FirebaseFirestore.instance.collection(bannerTxt);
    var docSnapshot = await checkIfDocExist(bannerData.bannerName);
    if (docSnapshot.exists) {
      try {
        await docSnapshot.reference.update(bannerData.toMap());
        var ref = docSnapshot.reference.withConverter(
            fromFirestore: Banner.fromDocument,
            toFirestore: (Banner banner, _) => banner.toMap());
        var docSnap = await ref.get();
        var banner = docSnap.data();
        _tryingAnApproach.value = banner;
        log.i(
          'in ifClause _tryingAnApproach.value will return: ${_tryingAnApproach.value?.bannerName} \n '
          'and image url: ${_tryingAnApproach.value?.bannerUrl}',
        );
        return banner;
      } catch (e) {
        // TODO: Find or create a way to repeat error handling without so much repeated code
        if (e is PlatformException) {
          print('Platform exception thrown is: ${e.message}');
        }
        print('unable to update fireStore. Error: ${e.toString()}');
      }
    } else {
      try {
        await _collectionRef.doc(bannerData.bannerName).set(bannerData.toMap());

        //var id = _collectionRef.doc(bannerData.bannerName).id;
        //getBannerRealtimeUpdate(docId: id);
        var docRef = _collectionRef.doc(bannerData.bannerName).withConverter(
              fromFirestore: Banner.fromDocument,
              toFirestore: (Banner banner, _) => banner.toMap(),
            );
        var docSnap = await docRef.get();
        var banner = docSnap.data();
        _tryingAnApproach.value = banner;
        log.i(
          'in ifClause _tryingAnApproach.value will return: ${_tryingAnApproach.value?.bannerName} \n '
          'and image url: ${_tryingAnApproach.value?.bannerUrl}',
        );
        return banner;
      } catch (e) {
        // TODO: Find or create a way to repeat error handling without so much repeated code
        if (e is PlatformException) {
          print('Platform exception thrown is: ${e.message}');
        }

        print(
            'unable to add banner details to fireStore. Error: ${e.toString()}');
      }
    }
    return null;
  }

  Future<DocumentSnapshot<Object?>> checkIfDocExist(String bannerName) async {
    log.i(
        'with parameter: $bannerName, where _collectionRef id is: ${_collectionRef.id}');
    try {
      var doc = await _collectionRef.doc(bannerName).get();
      return doc;
    } catch (e) {
      rethrow;
    }
  }

  List<Artwork?>? _tempFirstTierList = List<Artwork?>.empty(growable: true);
  List<Artwork?>? _tempSecTierList = List<Artwork?>.empty(growable: true);
  List<Artwork?>? _tempThirdTierList = List<Artwork?>.empty(growable: true);

  Future addArtwork(
      {required Artwork artworkData, required String path}) async {
    log.i(
        'param are artworkTitle: ${artworkData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Artwork? artworkDataFromFirestore;
    try {
      var docRef = await _collectionRef.add(artworkData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Artwork.fromDocument,
        toFirestore: (Artwork artwork, _) => artwork.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      artworkDataFromFirestore = Artwork(
        artworkUrl: temp1?.artworkUrl,
        title: temp1?.title,
        description: temp1?.description,
        price: temp1?.price,
        customTitle: temp1?.customTitle,
        id: docId,
      );
      if (path == firstTierArtworkTxt) {
        _tempFirstTierList = _reactiveListOfArtwork.value;
        _tempFirstTierList?.add(artworkDataFromFirestore);
        _reactiveListOfArtwork.value = _tempFirstTierList;
        //notifyListeners();
        log.i(
            'artworkDataFromFirestore imageURL: ${artworkDataFromFirestore.artworkUrl} and \n'
            'title: ${artworkDataFromFirestore.title}');
        log.i(
            'tempReactiveList has length: ${_tempFirstTierList?.length}, \n imageURL: ${_tempFirstTierList?.last?.artworkUrl} and \n'
            'title: ${_tempFirstTierList?.last?.title}');
        log.i(
            '_reactiveListOfArtwork length: ${_reactiveListOfArtwork.value?.length} imageURL: ${_reactiveListOfArtwork.value?.last?.artworkUrl} and \n'
            'title: ${_reactiveListOfArtwork.value?.last?.title}');
      } else if (path == secondTierArtworkTxt) {
        _tempSecTierList = _secTierReactiveListOfArtwork.value;
        _tempSecTierList?.add(artworkDataFromFirestore);
        _secTierReactiveListOfArtwork.value = _tempSecTierList;
        //notifyListeners();
      } else {
        _tempThirdTierList = _thirdTierReactiveListOfArtwork.value;
        _tempThirdTierList?.add(artworkDataFromFirestore);
        _thirdTierReactiveListOfArtwork.value = _tempThirdTierList;
        //notifyListeners();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getArtworkRealtimeUpdate({required String path}) {
    log.i('parameter collectionPath is: $path');
    FirebaseFirestore.instance.collection(path).snapshots().listen(
      (event) {
        if (path == firstTierArtworkTxt) {
          _reactiveListOfArtwork.value =
              event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
          _tempFirstTierList = _reactiveListOfArtwork.value;
          //notifyListeners();
        } else if (path == secondTierArtworkTxt) {
          _secTierReactiveListOfArtwork.value =
              event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
          _tempSecTierList = _secTierReactiveListOfArtwork.value;
          //notifyListeners();
        } else {
          _thirdTierReactiveListOfArtwork.value =
              event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
          _tempThirdTierList = _thirdTierReactiveListOfArtwork.value;
          //notifyListeners();
        }
      },
      onError: (error) => log.i('$path RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeArtworkFromFS({required Artwork artwork, required String path}) {
    log.i('params are, artwork id: ${artwork.id} and \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    _collectionRef.doc(artwork.id).delete();

    // remove from our listOfArtwork
    if (path == firstTierArtworkTxt) {
      _tempFirstTierList = _reactiveListOfArtwork.value!;
      bool? artworkWasRemoved = _tempFirstTierList?.remove(artwork);
      if (artworkWasRemoved == true) {
        reusableFunction.snackBar(
            message: '${artwork.title} has been deleted',
            duration: const Duration(seconds: 2));
      }
      _reactiveListOfArtwork.value = _tempFirstTierList;
      //notifyListeners();
    } else if (path == secondTierArtworkTxt) {
      _tempSecTierList = _secTierReactiveListOfArtwork.value!;
      bool? artworkWasRemoved = _tempSecTierList?.remove(artwork);
      if (artworkWasRemoved == true) {
        reusableFunction.snackBar(
            message: '${artwork.title} has been deleted',
            duration: const Duration(seconds: 2));
      }
      _secTierReactiveListOfArtwork.value = _tempSecTierList;
      //notifyListeners();
    } else {
      _tempThirdTierList = _thirdTierReactiveListOfArtwork.value!;
      bool? artworkWasRemoved = _tempThirdTierList?.remove(artwork);
      if (artworkWasRemoved == true) {
        reusableFunction.snackBar(
            message: '${artwork.title} has been deleted',
            duration: const Duration(seconds: 2));
      }
      _thirdTierReactiveListOfArtwork.value = _tempThirdTierList;
      //notifyListeners();
    }
  }
}
