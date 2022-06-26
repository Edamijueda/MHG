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
    listenToReactiveValues([_tryingAnApproach, _reactiveListOfArtwork]);
  }
  // Firestore class have issue calling CloudStorageService
  /*final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();*/

  final log = getStackedLogger('FirestoreDbService');
  final ReusableFunction reusableFunction = ReusableFunction();
  late CollectionReference _collectionRef;

  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  // Reactive Values
  late final ReactiveValue<List<Artwork?>?> _reactiveListOfArtwork =
      ReactiveValue<List<Artwork?>?>(null);

  List<Artwork?>? get reactiveListOfArtwork => _reactiveListOfArtwork.value;

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
        //var id = docSnapshot.reference.id;
        //getBannerRealtimeUpdate(docId: id);
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

  List<Artwork?> tempReactiveList = List<Artwork?>.empty(growable: true);
  Future addArtwork(Artwork artworkData) async {
    log.i('parameter, artwork title: ${artworkData.title}');
    _collectionRef = FirebaseFirestore.instance.collection(artworkTxt);
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
      tempReactiveList.add(artworkDataFromFirestore);
      _reactiveListOfArtwork.value = tempReactiveList;
      notifyListeners();
      log.i(
          'artworkDataFromFirestore imageURL: ${artworkDataFromFirestore.artworkUrl} and \n'
          'title: ${artworkDataFromFirestore.title}');
      log.i(
          'tempReactiveList has length: ${tempReactiveList.length}, \n imageURL: ${tempReactiveList.last?.artworkUrl} and \n'
          'title: ${tempReactiveList.last?.title}');
      log.i(
          '_reactiveListOfArtwork length: ${_reactiveListOfArtwork.value?.length} imageURL: ${_reactiveListOfArtwork.value?.last?.artworkUrl} and \n'
          'title: ${_reactiveListOfArtwork.value?.last?.title}');
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getArtworkRealtimeUpdate() {
    log.i('no parameter');
    //Artwork? artworkData;
    FirebaseFirestore.instance.collection(artworkTxt).snapshots().listen(
      (event) {
        _reactiveListOfArtwork.value =
            event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
        //notifyListeners();
        //_reactiveListOfArtwork.value = event.docs.cast();

        /*_artworkDataFromFirestore = Artwork(
          artworkUrl: temp?.artworkUrl,
          title: temp?.title,
          description: temp?.description,
          price: temp?.price,
          id: id,
        );*/
        /*log.i(
          'ArtworkData return title: ${_artworkDataFromFirestore?.title} \n '
          'and imageURL: ${_artworkDataFromFirestore?.artworkUrl}',
        );*/
      },
      onError: (error) =>
          log.i('ArtworkRealtimeUpdate() Listener failed: $error'),
    );
  }

  void removeArtworkFromFS(Artwork artwork) {
    log.i('parameter, id of artwork to remove is: ${artwork.id}');
    _collectionRef = FirebaseFirestore.instance.collection(artworkTxt);
    _collectionRef.doc(artwork.id).delete();

    // remove from our listOfArtwork
    var tempList = _reactiveListOfArtwork.value;
    bool? artworkWasRemoved = tempList?.remove(artwork);
    if (artworkWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${artwork.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
    _reactiveListOfArtwork.value = tempList;
    notifyListeners();
  }
}
