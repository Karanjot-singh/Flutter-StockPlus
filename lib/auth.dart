//firebase_login
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//async functions will not be executed asap, won't change or stop others functions
// that are working on with the application at the moment

Future<FirebaseUser> signInWithGoogle() async {

  //google related starts
  // Let the user sign in , get auth from google and get credential > to firebase, authenticate firebase
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
   //google related stuff ends

  //firebase user credntial passes
  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user; //firebase user
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);
  //firebase signed in user is the same as the google sign in user

  return user;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
}
