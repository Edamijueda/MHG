import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:stacked/stacked.dart';

class FirestoreDbService with ReactiveServiceMixin {
  FirestoreDbService() {
    listenToReactiveValues([_tryingAnApproach]);
  }

  final log = getStackedLogger('FirestoreDbService');
  late CollectionReference _collectionRef;

  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  late final ReactiveValue<Banner?> _tryingAnApproach =
      ReactiveValue<Banner?>(null);

  Banner? get tryingAnApproach => _tryingAnApproach.value;

  //set tryingAnApproach(Banner? banner) => _tryingAnApproach.value = banner;

  Artwork? _artworkDataFromFirestore;

  Artwork? get artworkDataFromFirestore => _artworkDataFromFirestore;

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

  Future<Artwork?> addArtwork(Artwork artworkData) async {
    log.i('parameter, artwork title: ${artworkData.title}');
    _collectionRef = FirebaseFirestore.instance.collection(artworkTxt);
    Artwork? artwork;
    try {
      var docRef = await _collectionRef.add(artworkData.toMap());
      //getArtworkRealtimeUpdate(id: docRef.id);
      /*log.i(
        'Artwork return with title: ${_artwork?.title} \n '
        'and imageURL: ${_artwork?.artworkUrl}',
      );*/
      //return _artwork;
      //return artwork;
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Artwork.fromDocument,
        toFirestore: (Artwork artwork, _) => artwork.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      artwork = Artwork(
        artworkUrl: temp1?.artworkUrl,
        title: temp1?.title,
        description: temp1?.description,
        price: temp1?.price,
        id: docId,
      );
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        print('Platform exception thrown is: ${e.message}');
      }

      print('Platform exception thrown is: ${e.toString()}');
    }
    return artwork;
  }

  getArtworkRealtimeUpdate({required String id}) {
    log.i('parameter: $id');
    //Artwork? artworkData;
    FirebaseFirestore.instance
        .collection(artworkTxt)
        .doc(id)
        .snapshots()
        .listen(
      (event) async {
        var docRef = event.reference.withConverter(
            fromFirestore: Artwork.fromDocument,
            toFirestore: (Artwork artwork, _) => artwork.toMap());
        var docSnap = await docRef.get();
        Artwork? temp = docSnap.data();
        _artworkDataFromFirestore = Artwork(
          artworkUrl: temp?.artworkUrl,
          title: temp?.title,
          description: temp?.description,
          price: temp?.price,
          id: id,
        );
        //= artworkData.id.
        log.i(
          'ArtworkData return title: ${_artworkDataFromFirestore?.title} \n '
          'and imageURL: ${_artworkDataFromFirestore?.artworkUrl}',
        );
      },
      onError: (error) =>
          log.i('ArtworkRealtimeUpdate() Listener failed: $error'),
    );
  }
}
