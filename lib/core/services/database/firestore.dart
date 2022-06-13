import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';

class FirestoreDbService {
  late CollectionReference _collectionRef;

  //late DocumentReference _docRef;
  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  //DocumentReference? get bannerFireStoreDocRef => _bannerFireStoreDocRef;

  //final log = StackedLogger();

  Future<Banner?> addBanner(Banner bannerData) async {
    _collectionRef = FirebaseFirestore.instance.collection(bannerTxt);
    var docSnapshot = await checkIfDocExist(bannerData.bannerName);
    if (docSnapshot.exists) {
      try {
        await docSnapshot.reference.update(bannerData.toMap());
        var ref = docSnapshot.reference.withConverter(
            fromFirestore: Banner.fromDocument,
            toFirestore: (Banner banner, _) => banner.toMap());
        final docSnap = await ref.get();
        final banner = docSnap.data();
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

        final docRef = _collectionRef.doc(bannerData.bannerName).withConverter(
              fromFirestore: Banner.fromDocument,
              toFirestore: (Banner banner, _) => banner.toMap(),
            );
        final docSnap = await docRef.get();
        final Banner? banner = docSnap.data();
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

  Future addArtwork(Artwork artworkData) async {
    _collectionRef = FirebaseFirestore.instance.collection(artworkTxt);
    try {
      //doc(bannerData.bannerName).set(bannerData.toMap());
      var docRef = await _collectionRef.add(artworkData.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        print('Platform exception thrown is: ${e.message}');
      }

      print('Platform exception thrown is: ${e.toString()}');
    }

    /*var docSnapshot = await checkIfDocExist(bannerData.bannerName);
    if(docSnapshot.exists){
      try {
        await docSnapshot.reference.update(bannerData.toMap());//_bannerCollectionRef.doc(bannerData.bannerName).set(bannerData.toMap());
      } catch (e) {
        // TODO: Find or create a way to repeat error handling without so much repeated code
        if (e is PlatformException) {
          print('Platform exception thrown is: ${e.message}');
        }

        print('Platform exception thrown is: ${e.toString()}');
      }
    }
    else{
      try {
        await _bannerCollectionRef.doc(bannerData.bannerName).set(bannerData.toMap());
      } catch (e) {
        // TODO: Find or create a way to repeat error handling without so much repeated code
        if (e is PlatformException) {
          print('Platform exception thrown is: ${e.message}');
        }

        print('Platform exception thrown is: ${e.toString()}');
      }
    }*/
  }

  Future<DocumentSnapshot<Object?>> checkIfDocExist(String bannerName) async {
    try {
      var doc = await _collectionRef.doc(bannerName).get();
      return doc;
    } catch (e) {
      rethrow;
    }
  }

  getBannerRealtimeUpdate(Banner bannerData) {
    /*_collectionRef = FirebaseFirestore.instance.collection(bannerTxt);
    var docRef = _collectionRef.doc(bannerData.bannerName).snapshots().listen(
          (event) {},
      onError:
        );*/
  }
}
