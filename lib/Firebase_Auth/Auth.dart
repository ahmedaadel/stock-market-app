import 'package:firebase_auth/firebase_auth.dart';

class Auth
{
  static final FirebaseAuth _auth = FirebaseAuth.instance;


 static Future<UserCredential> signUp({
    required String email,
    required String password,})
  async {
    var newAcc ;
    try {
       newAcc = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (newAcc.user != null) print('Success');
    } catch (error) {
      print(error.toString());
    }
    return newAcc ;
  }



static Future<User?> signIn(
    {required String email,
    required String password,})
async {

  User? user;
  try {
    UserCredential usr = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    user = usr.user;
  }  catch (e) {
      print(e.toString());
  }
  return user;
}


}