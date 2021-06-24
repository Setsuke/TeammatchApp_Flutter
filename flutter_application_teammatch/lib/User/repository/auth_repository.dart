import 'package:flutter_application_teammatch/User/repository/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<UserCredential> signInFirebase() => _firebaseAuthAPI.singIn();
}
