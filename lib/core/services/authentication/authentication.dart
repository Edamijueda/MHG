// Dis service will provide d functionality to login & signUp. In d future it
// will also hold our current profile which we can access at any time in d view
// models. It will also do some basic caching if we require on the local
// preferences & it will handle all d auth functionality within the app

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:mhg/app/app.locator.dart';
import 'package:mhg/app/app.logger.dart';
import 'package:mhg/constants.dart';
import 'package:mhg/core/models/login/login.dart';
import 'package:mhg/core/models/profile/profile.dart';
import 'package:mhg/core/services/database/firestore.dart';
import 'package:mhg/ui/screens/admin/admin_home/admin_home_view.dart';
import 'package:mhg/ui/screens/customer/view.dart';
import 'package:mhg/ui/screens/retail/view.dart';
import 'package:mhg/utils/reusable_funtions.dart';
import 'package:stacked_services/stacked_services.dart';

//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter/foundation.dart';

class AuthenticationService {
  final log = getStackedLogger('AuthenticationService');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ReusableFunc reusableFunction = ReusableFunc();
  final _navService = locator<NavigationService>();
  final FirestoreDbService _fireStoreDbService = locator<FirestoreDbService>();

  final String developerUid = 'mVSQ2U2FHZNYqpCudSP412Qsm163';

  //List<String>? backupAdminOrDevLoginDetails;

  Future loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.uid == developerUid) {
        //backupAdminOrDevLoginDetails?[0] = email;
        //backupAdminOrDevLoginDetails?[1] = password;
        /*log.i('backupAdmin loginDetails has email: '
            '${backupAdminOrDevLoginDetails?[0]} \n password: '
            '${backupAdminOrDevLoginDetails?[1]}');*/

        await _navService.navigateToView(
          AdminHomeView(
            login: Login(mail: email, pass: password),
          ),
        );
      } else {
        var docSnapshot = await _fireStoreDbService.checkIfDocExist(
          userCredential.user!.uid,
          usersProfilePathTxt,
        );
        if (docSnapshot.exists) {
          try {
            var docRef = docSnapshot.reference.withConverter(
                fromFirestore: UserProfile.fromDocument,
                toFirestore: (UserProfile userProfile, _) =>
                    userProfile.toMap());
            late UserProfile userProfile;
            await docRef.get().then((value) {
              userProfile = value.data()!;
            });
            if (userProfile.userType == customerTxt) {
              log.i('userProfile has userType: ${userProfile.userType} \n'
                  'uid: ${userProfile.uid}');
              _navService.navigateToView(CustomerView(profile: userProfile));
            } else {
              log.i('userProfile has userType: ${userProfile.userType} \n'
                  'uid: ${userProfile.uid}');
              _navService.navigateToView(RetailUserView(profile: userProfile));
            }
          } catch (e) {
            if (e is PlatformException) {
              log.i('Platform exception thrown is error code: ${e.code} \n'
                  'message: ${e.message}');
            }
            log.i('unable to update fireStore. Error: ${e.toString()}');
          }
        } else {
          reusableFunction.snackBar(
              message:
                  'Fail to login: Contact admin mail: max@sonorwinesamerica.com',
              duration: const Duration(seconds: 3));
        }
      }
    } on FirebaseAuthException catch (e) {
      // print('Failed with error code: ${e.code}');
      //print(e.message);
      if (e.code == 'profile-not-found') {
        reusableFunction.snackBar(
            message:
                'No profile found for this email. Fail with code: ${e.code}',
            duration: const Duration(seconds: 2));
      } else if (e.code == 'wrong-password') {
        reusableFunction.snackBar(
            message: 'Wrong profile password. Fail with code: ${e.code}',
            duration: const Duration(seconds: 2));
      }
    }
  }

  Future<bool> checkIfEmailExist(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // profile using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } on FirebaseAuthException catch (error) {
      log.i(
          'Failed with error code: ${error.code}, and \n Message: ${error.message}');
      reusableFunction.snackBar(
          message:
              'Fail with code: ${error.code}, \n message: ${error.message}',
          duration: const Duration(seconds: 3));
      // a stackoverflow answer return true;
      return false;
    }
  }

  //Account creation request use this
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      log.i('parameter has email: $email and password: $password');
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await getUserCred(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //print('Failed with error code: ${e.code}');
      log.i('${e.code}: ${e.message}');
      reusableFunction.snackBar(
          message: '${e.code}: ${e.message}',
          duration: const Duration(seconds: 4));
    }
    return null;
  }

  Future<User?> getUserCred(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log.i('${e.code}: ${e.message}');
    }
    return null;
  }

  Future<User?> deleteRejectedReq(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      log.i('${e.code}: ${e.message}');
    }
    return null;
  }

// SigningUp with Google. This is used in the code
/*final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? _signedInUser;
  GoogleSignInAccount get signedInUser => _signedInUser!;*/

/*Future googleLoginAuth() async {
    try {
      final profile = await _googleSignIn.signIn();
      if (profile == null) return;
      _signedInUser = profile;

      final googleAuth = await profile.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // We are now ready to use the above credential to signIn into firebase
      await _firebaseAuth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e.toString());
    }
  }*/

// To get the current profile that is signedIn
/*String? currentUser(String requestedUserData) {
    var profile = _firebaseAuth.currentUser;
    if (requestedUserData == name) {
      return profile?.displayName;
    }
  }*/

// To permit profile signOut authentication
/*Future googleLogoutAuth() async {
    await _googleSignIn.disconnect();
    _firebaseAuth.signOut();
  }

  // Get the ID of the current profile that is signedIn
  String get currentUserID => _firebaseAuth.currentUser!.uid;*/
}
