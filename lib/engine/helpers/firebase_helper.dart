import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/engine/helpers/sessions.dart';

class FirebaseHelper {
  static void listenToUserSignInStatus() =>
      FirebaseAuth.instance.idTokenChanges().listen(
        (User? user) {
          if (user == null) {
            GoogleSignIn().signOut();
            Sessions.clear();
          } else {
            user.getIdTokenResult().then((value) {
              Sessions.setFirebaseToken(value.token!);
            });
          }
        },
      );
}
