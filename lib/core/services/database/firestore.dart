import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/artwork/artwork.dart';
import 'package:mhg/core/models/banner/banner.dart';
import 'package:mhg/core/models/device/device.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked/stacked.dart';

class FirestoreDbService with ReactiveServiceMixin {
  FirestoreDbService() {
    listenToReactiveValues([
      _tryingAnApproach,
      _firstTierReactiveListOfArtwork,
      _secTierReactiveListOfArtwork,
      _thirdTierReactiveListOfArtwork,
      _reactivePipe,
      _reactiveGrinder,
      _reactiveRoller,
      _reactiveTaster,
      _reactiveBong,
      _reactiveDabRing,
      _reactiveBubble,
    ]);
  }

  final log = getStackedLogger('FirestoreDbService');
  final ReusableFunction reusableFunction = ReusableFunction();
  late CollectionReference _collectionRef;

  Banner? _bannerDataFromFirestore;

  Banner? get bannerDataFromFirestore => _bannerDataFromFirestore;

  // Reactive Values
  late final ReactiveValue<List<Artwork?>?> _firstTierReactiveListOfArtwork =
      ReactiveValue<List<Artwork?>?>(null);

  List<Artwork?>? get firstTierReactiveListOfArtwork =>
      _firstTierReactiveListOfArtwork.value;
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
        url: temp1?.url,
        title: temp1?.title,
        description: temp1?.description,
        price: temp1?.price,
        customTitle: temp1?.customTitle,
        id: docId,
      );
      if (path == firstTierArtworkTxt) {
        _tempFirstTierList = _firstTierReactiveListOfArtwork.value;
        _tempFirstTierList?.add(artworkDataFromFirestore);
        _firstTierReactiveListOfArtwork.value = _tempFirstTierList;
        //notifyListeners();
        log.i(
            'artworkDataFromFirestore imageURL: ${artworkDataFromFirestore.url} and \n'
            'title: ${artworkDataFromFirestore.title}');
        log.i(
            'tempReactiveList has length: ${_tempFirstTierList?.length}, \n imageURL: ${_tempFirstTierList?.last?.url} and \n'
            'title: ${_tempFirstTierList?.last?.title}');
        log.i(
            '_reactiveListOfArtwork length: ${_firstTierReactiveListOfArtwork.value?.length} imageURL: ${_firstTierReactiveListOfArtwork.value?.last?.url} and \n'
            'title: ${_firstTierReactiveListOfArtwork.value?.last?.title}');
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
          _firstTierReactiveListOfArtwork.value =
              event.docs.map((e) => Artwork.fromDocument(e, null)).toList();
          _tempFirstTierList = _firstTierReactiveListOfArtwork.value;
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
      _tempFirstTierList = _firstTierReactiveListOfArtwork.value!;
      bool? artworkWasRemoved = _tempFirstTierList?.remove(artwork);
      if (artworkWasRemoved == true) {
        reusableFunction.snackBar(
            message: '${artwork.title} has been deleted',
            duration: const Duration(seconds: 2));
      }
      _firstTierReactiveListOfArtwork.value = _tempFirstTierList;
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

  //////////////////////////////////////////////////////////////////////////////
  //                        DEVICE fireStore functions
  ////////////////////////////////////////////////////////////////////////////////
  final ReactiveValue<List<Device>?> _reactivePipe =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactivePipe => _reactivePipe.value;
  List<Device>? _tempPipeList = List<Device>.empty(growable: true);

  Future addPipe({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempPipeList = _reactivePipe.value;
        _tempPipeList?.add(dataFromFS);
        _reactivePipe.value = _tempPipeList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has deviceUrl: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempPipeList has length: ${_tempPipeList?.length}, \n deviceUrl: ${_tempPipeList?.last.url} and \n'
            'title: ${_tempPipeList?.last.title}');
        log.i(
            '_reactivePipe length: ${_reactivePipe.value?.length} deviceUrl: ${_reactivePipe.value?.last.url} and \n'
            'title: ${_reactivePipe.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getPipeRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(pipeDbPathTxt).snapshots().listen(
      (event) {
        _reactivePipe.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempPipeList = _reactivePipe.value;
      },
      onError: (error) => log
          .i('$pipeDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removePipeFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(pipeDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempPipeList = _reactivePipe.value;
    bool? deviceWasRemoved = _tempPipeList?.remove(device);
    _reactivePipe.value = _tempPipeList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _reactiveGrinder =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactiveGrinder => _reactiveGrinder.value;
  List<Device>? _tempGrinderList = List<Device>.empty(growable: true);

  Future addGrinder({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempGrinderList = _reactiveGrinder.value;
        _tempGrinderList?.add(dataFromFS);
        _reactiveGrinder.value = _tempGrinderList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has imageURL: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempPipeList has length: ${_tempGrinderList?.length}, \n imageURL: ${_tempGrinderList?.last.url} and \n'
            'title: ${_tempGrinderList?.last.title}');
        log.i(
            '_reactivePipe length: ${_reactiveGrinder.value?.length} imageURL: ${_reactiveGrinder.value?.last.url} and \n'
            'title: ${_reactiveGrinder.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getGrinderRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(grinderDbPathTxt).snapshots().listen(
      (event) {
        _reactiveGrinder.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempGrinderList = _reactiveGrinder.value;
      },
      onError: (error) => log.i(
          '$grinderDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeGrinderFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(grinderDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempGrinderList = _reactiveGrinder.value;
    bool? deviceWasRemoved = _tempGrinderList?.remove(device);
    _reactiveGrinder.value = _tempGrinderList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _reactiveRoller =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactiveRoller => _reactiveRoller.value;
  List<Device>? _tempRollerList = List<Device>.empty(growable: true);

  Future addRoller({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempRollerList = _reactiveRoller.value;
        _tempRollerList?.add(dataFromFS);
        _reactiveRoller.value = _tempRollerList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has imageURL: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempRollerList has length: ${_tempRollerList?.length}, \n imageURL: ${_tempRollerList?.last.url} and \n'
            'title: ${_tempRollerList?.last.title}');
        log.i(
            '_reactiveRoller length: ${_reactiveRoller.value?.length} imageURL: ${_reactiveRoller.value?.last.url} and \n'
            'title: ${_reactiveRoller.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getRollerRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(rollerDbPathTxt).snapshots().listen(
      (event) {
        _reactiveRoller.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempRollerList = _reactiveRoller.value;
      },
      onError: (error) => log.i(
          '$rollerDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeRollerFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(rollerDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempRollerList = _reactiveRoller.value;
    bool? deviceWasRemoved = _tempRollerList?.remove(device);
    _reactiveRoller.value = _tempRollerList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _reactiveTaster =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactiveTaster => _reactiveTaster.value;
  List<Device>? _tempTasterList = List<Device>.empty(growable: true);

  Future addTaster({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempTasterList = _reactiveTaster.value;
        _tempTasterList?.add(dataFromFS);
        _reactiveTaster.value = _tempTasterList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has imageURL: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempTasterList has length: ${_tempTasterList?.length}, \n imageURL: ${_tempTasterList?.last.url} and \n'
            'title: ${_tempTasterList?.last.title}');
        log.i(
            '_reactiveTaster length: ${_reactiveTaster.value?.length} imageURL: ${_reactiveTaster.value?.last.url} and \n'
            'title: ${_reactiveTaster.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getTasterRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(tasterDbPathTxt).snapshots().listen(
      (event) {
        _reactiveTaster.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempTasterList = _reactiveTaster.value;
      },
      onError: (error) => log.i(
          '$tasterDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeTasterFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(tasterDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempTasterList = _reactiveTaster.value;
    bool? deviceWasRemoved = _tempTasterList?.remove(device);
    _reactiveTaster.value = _tempTasterList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _reactiveBong =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactiveBong => _reactiveBong.value;
  List<Device>? _tempBongList = List<Device>.empty(growable: true);

  Future addBong({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempBongList = _reactiveBong.value;
        _tempBongList?.add(dataFromFS);
        _reactiveBong.value = _tempBongList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has imageURL: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempBongList has length: ${_tempBongList?.length}, \n imageURL: ${_tempBongList?.last.url} and \n'
            'title: ${_tempBongList?.last.title}');
        log.i(
            '_reactiveBong length: ${_reactiveBong.value?.length} imageURL: ${_reactiveBong.value?.last.url} and \n'
            'title: ${_reactiveBong.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getBongRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(bongDbPathTxt).snapshots().listen(
      (event) {
        _reactiveBong.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempBongList = _reactiveBong.value;
      },
      onError: (error) => log
          .i('$bongDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeBongFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(bongDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempBongList = _reactiveBong.value;
    bool? deviceWasRemoved = _tempBongList?.remove(device);
    _reactiveBong.value = _tempBongList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _reactiveDabRing =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactiveDabRing => _reactiveDabRing.value;
  List<Device>? _tempDabRingList = List<Device>.empty(growable: true);

  Future addDabRing({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempDabRingList = _reactiveDabRing.value;
        _tempDabRingList?.add(dataFromFS);
        _reactiveDabRing.value = _tempDabRingList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has deviceURL: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempDabRingList has length: ${_tempDabRingList?.length}, \n deviceURL: ${_tempDabRingList?.last.url} and \n'
            'title: ${_tempDabRingList?.last.title}');
        log.i(
            '_reactiveDabRing length: ${_reactiveDabRing.value?.length} deviceURL: ${_reactiveDabRing.value?.last.url} and \n'
            'title: ${_reactiveDabRing.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getDabRingRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(dabRingDbPathTxt).snapshots().listen(
      (event) {
        _reactiveDabRing.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempDabRingList = _reactiveDabRing.value;
      },
      onError: (error) => log.i(
          '$dabRingDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeDabRingFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(dabRingDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempDabRingList = _reactiveDabRing.value;
    bool? deviceWasRemoved = _tempDabRingList?.remove(device);
    _reactiveDabRing.value = _tempDabRingList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  final ReactiveValue<List<Device>?> _reactiveBubble =
      ReactiveValue<List<Device>?>(null);

  List<Device>? get reactiveBubble => _reactiveBubble.value;
  List<Device>? _tempBubbleList = List<Device>.empty(growable: true);

  Future addBubble({required Device deviceData, required String path}) async {
    log.i(
        'param are deviceTitle: ${deviceData.title} \n collectionPath: $path');
    _collectionRef = FirebaseFirestore.instance.collection(path);
    Device dataFromFS;
    try {
      var docRef = await _collectionRef.add(deviceData.toMap());
      var docId = docRef.id;
      var temp = docRef.withConverter(
        fromFirestore: Device.fromDocument,
        toFirestore: (Device device, _) => device.toMap(),
      );
      var docSnap = await temp.get();
      var temp1 = docSnap.data();
      if (temp1 != null) {
        dataFromFS = Device(
          url: temp1.url,
          title: temp1.title,
          description: temp1.description,
          price: temp1.price,
          customTitle: temp1.customTitle,
          id: docId,
        );
        _tempBubbleList = _reactiveBubble.value;
        _tempBubbleList?.add(dataFromFS);
        _reactiveBubble.value = _tempBubbleList;
        //notifyListeners();
        log.i('DeviceDataFromFirestore has deviceUrl: ${dataFromFS.url} and \n'
            'title: ${dataFromFS.title}');
        log.i(
            '_tempBubbleList has length: ${_tempBubbleList?.length}, \n deviceUrl: ${_tempBubbleList?.last.url} and \n'
            'title: ${_tempBubbleList?.last.title}');
        log.i(
            '_reactiveBubble length: ${_reactiveBubble.value?.length} deviceUrl: ${_reactiveBubble.value?.last.url} and \n'
            'title: ${_reactiveBubble.value?.last.title}');
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        log.i('Platform exception thrown is: ${e.message}');
      }
      log.i('error  thrown is: ${e.toString()}');
    }
  }

  getBubbleRealtimeUpdate() {
    log.i('no parameter');
    FirebaseFirestore.instance.collection(bubbleDbPathTxt).snapshots().listen(
      (event) {
        _reactiveBubble.value =
            event.docs.map((e) => Device.fromDocument(e, null)).toList();
        _tempBubbleList = _reactiveBubble.value;
      },
      onError: (error) => log.i(
          '$bubbleDbPathTxt FireStore RealtimeUpdate Listener failed: $error'),
    );
  }

  void removeBubbleFromFS({required Device device}) {
    log.i('params device with id: ${device.id}');
    _collectionRef = FirebaseFirestore.instance.collection(bubbleDbPathTxt);
    _collectionRef.doc(device.id).delete();

    // remove from our listOfArtwork
    _tempBubbleList = _reactiveBubble.value;
    bool? deviceWasRemoved = _tempBubbleList?.remove(device);
    _reactiveBubble.value = _tempBubbleList;
    if (deviceWasRemoved == true) {
      reusableFunction.snackBar(
          message: '${device.title} has been deleted',
          duration: const Duration(seconds: 2));
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  //                          DEVICE fireStore functions
  //////////////////////////////////////////////////////////////////////////////
}
