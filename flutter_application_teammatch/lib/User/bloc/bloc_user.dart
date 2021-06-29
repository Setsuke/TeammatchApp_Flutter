import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_teammatch/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  Future<UserCredential> signIn() {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    print('login');
    analytics.logEvent(name: "Login_Google", parameters: <String, dynamic>{
      'plant_name': 'String',
    });
    return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {}
}
