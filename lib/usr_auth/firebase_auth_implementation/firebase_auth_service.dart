// import 'package:firebase_auth/firebase_auth.dart';
//
// class FirebaseAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<User?> signupWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential credential = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } catch (e) {
//       print("Some Error Occured");
//     }
//     return null;
//   }
//
//   Future<User?> signInwithemailandpassword(
//       String email, String Password) async {
//     try {
//       UserCredential credential = await _auth.signInWithEmailAndPassword(
//           email: email, password: Password);
//       return credential.user;
//     } catch (e) {
//       print("Some Error Occured");
//     }
//     return null;
//   }
// }
