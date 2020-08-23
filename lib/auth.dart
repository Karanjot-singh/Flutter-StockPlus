import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth =FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//async functions will not be executed asap, won't change or stop others functions
// that are working on with the application at the moment

Future<FirebaseUser> signInWithUser() async{
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignIn.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication, accessToken: googleSignInAuthentication.accessToken);
  final AuthResult authResult = await _auth.signInWithCredential(credential);
}