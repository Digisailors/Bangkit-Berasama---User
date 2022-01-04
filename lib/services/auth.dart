import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();

  // Future<User> signInAnonymously();

  Future<User?> signInWithEmailAndPassword(String email, String password);

  Future<User?> createUserWithEmailAndPassword(String email, String password);

  // Future<User> signInWithGoogle();

  // Future<User> signInWithFacebook();

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  @override
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  signInwithPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {},
      verificationFailed: (FirebaseAuthException error) {},
    );
  }

  @override
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
