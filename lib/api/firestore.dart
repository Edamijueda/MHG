// Here we need to create two functions relating to the user. The first create
// a new user doc in the db using the id passed in. The second one is to get the
// user, which return the user from the userCollection, if a doc with the id
// exist
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:mhg/app/app.logger.dart';
//import 'package:mhg/exceptions/firestore_api.dart';

/*class FireStoreApi {
  final log = getStackedLogger('FirestoreApi');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required User user}) async {
    log.i('param user is: $user');
    try {
      final userDocRef = userCollection.doc(user.uid);
      //await userDocRef.set(user.toJson());
      log.v('userCreated at ${userDocRef.path}');
    } catch (error) {
      throw FirestoreApiException(
          message: 'fail to create new User', devDetails: '$error');
    }
  }

  Future<User?> getUser({required String uid}) async {
    log.i('param userId is: $uid');
    if (uid.isNotEmpty) {
      final userDocSnap = await userCollection.doc(uid).get();
      if (!userDocSnap.exists) {
        log.v('we have no user with id $uid in our db');
        return null;
      }
      // Handle existence of a user with the id
      final userData = userDocSnap.data();
      log.v('User found. data: $userData');
      //return User.fromJson(userData!);
      return null;
    } else {
      throw FirestoreApiException(
          message:
              'userId passed in is empty. Pls pass in valid userID if from your firebase user');
    }
  }
}*/
